#!/bin/bash

# update and upgrade

sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

# install python
sudo apt-get-install python3 -y
sudo apt-get install python3-pip -y
sudo pip install awscli

#alias 
alias python3=python

# AWS login

aws configure

# then enter your "access key"
# then enter your "secret access key"
# eu-west-1
# json

# aws s3 ls s3://tech515-oliver-test-boto3

# list all s3 buckets
aws s3 ls
# create an S3 bucket
aws s3 mb s3://tech515-oliver-test-boto3
#upload data/file to the bucket
echo test file for boto3 > testfile.txt
aws s3 cp testfile.txt s3://tech515-oliver-test-boto3
#Download/retrieve content/file from the S3 bucket
aws s3 sync s3://tech515-oliver-test-boto3 .
#Delete content/file from the S3 bucket
aws s3 rm s3://tech515-oliver-test-boto3/testfile.txt --recursive
#Delete the bucket
aws s3 rb s3://tech515-oliver-test-boto3 --force



