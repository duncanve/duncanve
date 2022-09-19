#!/bin/bash 


if [[ -z $1 ]] || [[ -z $2 ]] || [[ -z $3 ]] 
then 
  echo "first argument is path to disk" 
  echo "second argument is disk encryption passwd" 
  echo "third argument is type of disk ssd or nvme" 
  exit 1
else 
  read -p " are you sure ? all your data will be fuckt up after this: " -n 1 -r 
  sudo apt update 
  sudo apt install -y python3 python-is-python3 python3-pip 
  pip3 install ansible==5.8.0 
  ~/.local/bin/ansible-galaxy collection install community.general community.crypto 
  echo 
  if  [[ $REPLY =~ ^[Yy]$  ]] 
  then 
    if [[  "$3" == "nvme"  ]] 
    then 
      ~/.local/bin/ansible-playbook dior.yml -e "install_disk=${1} passphrase=${2}" --become-user root --become-method sudo 
     else 
      ~/.local/bin/ansible-playbook louis_vuitton.yml -e "install_disk=${1} passphrase=${2}" --become-user root --become-method sudo
    fi
    lsblk --output NAME,KNAME $1
  else
    echo "good choice" 
  fi
fi 

