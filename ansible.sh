component=$1

rm -f ~/secrets.json ~/app.json
ansible-playbook get-secrets.yml -e vault_token=$vault_token -e  role_name=$component -e env=$env
ansible-playbook -i $component-$env.shujathdevops.online, -e  role_name=$component expense-play.yml -e env=$env -e '@~/secrets.json' -e '@~/app.json'
rm -f ~/secrets.json ~/app.json
