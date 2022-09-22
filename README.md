# Automation scripts to tag aws resources

## Index:
- configure aws cli to aws sandbox: setup_aws_cli.sh
- generate if not exist a key-pair and upload to aws key pairs: import_key_pair.sh
- create instances from list of names in `instances_name.txt`: create_instances.sh

## Setting up AWS CLI for the sandbox
file: setup_aws_cli.sh

Command:
```
bash setup_aws_cli.sh <access key id> <secret access key> [region] [output format]
```
* default region: us-east-1
* default output format: json

## Generate if not exist, and upload key-pair to aws
file: import_key_pair.sh

Command:
```
bash import_key_pair.sh
```

## Create instances
file: create_instances.sh
* get names of instances from `instances_name.txt`
  * Example of the file content (leave 2 empty lines to create first instance without tag:Name, subsequently leave one empty line):
    ```
    instance01
    instance02


    ```
* creates instances with tag:Name.

Command:
```
bash create_instances.sh
```