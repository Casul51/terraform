#!/bin/bash

export TF_VAR_username=
export TF_VAR_password=
export TF_VAR_ip=

spass () {
	  /usr/bin/expect <(cat << EOF
spawn $*
expect "assword:"
send "$TF_VAR_password\r"
interact
EOF
)
	
}


#add expect
spass scp ./uuid_changer_cml.sh $TF_VAR_username@$TF_VAR_ip:/uuid_changer_cml.sh 
spass ssh $TF_VAR_username@$TF_VAR_ip "pkill uuid_changer_cml.sh" 
spass ssh $TF_VAR_username@$TF_VAR_ip "chmod +x /uuid_changer_cml.sh " 
spass ssh $TF_VAR_username@$TF_VAR_ip "/uuid_changer_cml.sh >/dev/null 2>&1 &" 

sleep 1


terraform plan -v
terraform apply
