apt-add-respository ppa:ansible/ansible -y
apt update -y
apt install ansible -y
ansible-playbook -c local provision.yml
