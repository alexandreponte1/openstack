# openstack

#install microstack
sudo apt update && sudo apt upgrade -y
sudo apt install snapd -y
sudo snap install microstack --beta 
sudo microstack init --auto --control


senha (sudo snap get microstack config.credentials.keystone-password)


https://meuip/

user name admin

Criar um arquivo 
~/microstackrc

export OS_USERNAME=admin
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_NAME=Default
export OS_PROJECT_DOMAIN_NAME=Default
export OS_AUTH_URL=http://localhost:5000/v3
export OS_IDENTITY_API_VERSION=3
export OS_IMAGE_API_VERSION=2
export OS_PASSWORD=$(sudo snap get microstack config.credentials.keystone-password)

source ~/microstackrc



microstack.openstack keypair create my-new-key

microstack.openstack keypair list



microstack.openstack keypair list



sudo snap disable microstack


