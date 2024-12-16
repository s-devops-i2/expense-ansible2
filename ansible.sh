component=$1

ansible-playbook get-secrets.yml -e vault_token=$vault_token
ansible-playbook -i $component-$env.shujathdevops.online, -e  role_name=$component expense-play.yml -e env=$env -e "@secrets.json" -e "@app.json"

