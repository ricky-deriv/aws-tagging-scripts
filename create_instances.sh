#!/bin/bash

# set aws profile env variable
source vars.txt
export AWS_PROFILE

# check profile in use
user_exist=$(aws sts get-caller-identity | jq .Arn | grep -i cloud_user)

if [[ -z "$user_exist" ]]; then
    echo "username does not match"
    exit
fi

KEY_PAIR_NAME="sandbox-key"
INSTANCES_FILE="instances_name.txt"

while read -r name
do
    output=$(aws ec2 run-instances \
    --image-id ami-05fa00d4c63e32376 \
    --instance-type t2.micro \
    --key-name $KEY_PAIR_NAME \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value='$name'}]")
    echo $output | jq .Instances[].InstanceId
done < "$INSTANCES_FILE"

echo "[complete] creation of instances complete!"