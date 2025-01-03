component=$1

rm -f ~/*.json
ansible-playbook -vvv get-secrets.yml -e vault_token=$vault_token -e  role_name=$component -e env=$env
exit 1
ansible-playbook -i $component-$env.shujathdevops.online, -e  role_name=$component expense-play.yml -e env=$env -e '@~/secrets.json'
rm -f ~/*.json

