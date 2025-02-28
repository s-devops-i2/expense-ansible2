component=$1

rm -f ~/*.json
ansible-playbook -vvv get-secrets.yml -e vault_token=$vault_token -e  role_name=$component -e env=$env
#ansible-playbook -i $component-$env.shujadevops.shop, -e  role_name=$component expense-play.yml -e env=$env -e '@~/secrets.json'

aws ec2 describe-instances --filters Name=tag:Name,Values=$env-$component Name=instance-state-name,Values=running --query 'Reservations[*].Instances[*].PrivateIpAddress' --output text >inv
ansible-playbook -i inv -e role_name=$component expense-play.yml -e env=$env -e '@~/secrets.json'
rm -f ~/*.json

