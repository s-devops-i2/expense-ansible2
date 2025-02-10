component=$1

rm -f ~/*.json
ansible-playbook -vvv get-secrets.yml -e vault_token=$vault_token -e  role_name=$component -e env=$env
ansible-playbook -i $component-$env.shujadevops.shop, -e  role_name=$component expense-play.yml -e env=$env -e '@~/secrets.json'
rm -f ~/*.json

