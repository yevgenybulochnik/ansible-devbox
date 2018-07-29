apt install software-properties-common -y
apt-add-repository ppa:ansible/ansible -y
apt update -y
apt install ansible -y
ansible-playbook -c local provision.yml
