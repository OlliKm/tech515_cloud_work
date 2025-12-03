# What is AWS S3

## What is AWS S3?
* simple Storage Service 
* Used to store and retrieve any amount of data from anywhere you are connected to the internet
* Easy to configure to host a static website on the cloud
* provides built-in redundancy
  * A copy of the data is in a minimum of 3 Availability Zones in the region 
* Can be accessed through the AWS Console & AWS CLI
* equivalent to Azure Blob Storage
  
## How is data stored?
* In buckets (equivalent to containers in Azure)

# commands used

> sudo apt-get install python3
> sudo apt-get install python3-pip -y
> sudo pip install awscli

alias python3=python

> aws configure"
then enter your "access key"
then enter your "secret access key"
eu-west-1
json

aws s3 ls
aws s3 help

### how to do the manipulate S3 storage using AWS CLI /commands to use
  - list the buckets:
  
    - aws s3 ls
  
  - make a bucket:
> aws s3 mb s3://tech515-oliver-first-bucket
  
  - Upload a file to s3
> aws s3 cp test.txt s3://tech515-oliver-first-bucket
 
  - list files in a bucket
> aws s3 ls s3://tech515-oliver-first-bucket

  - download files from buckets
> aws s3 sync s3://tech515-oliver-first-bucket .

  - remove a single file bucket
>  aws s3 rm s3://tech515-oliver-first-bucket/test.txt

  - remove the all files from bucket
 > aws s3 rm --recursive s3://tech515-oliver-first-bucket

- ⚠️ Danger: will delete everything in the bucket without prompting (asking)
- - remove bucket with files in it
> aws s3 rb s3://tech515-oliver-first-bucket -- force
    - ⚠️ Danger: will delete the bucket and everything in the bucket without prompting (asking)











 # Task 1
 #### Use python boto3 to manipulate S3 storage
[Link to script](/other/py-boto-se.sh)

Pre-requisites
You will need an EC2 instance running the Sparta test app
Step 1: Do it manually
Find a cat image on the web (either jpeg, jpg, or png)
Download it onto your VM
Upload it to S3 storage to your own bucket
Set permissions to make your uploaded cat image publicly accessible
Modify the app's homepage to include the cat image saved & use pm2 command(s) to see the changes take effect in your refreshed web browser tab
Step 2: Automate
Create a Bash script called use-s3-image-on-homepage.sh to make bucket, upload the cat image to S3, set permissions for public access, modify the app code to use to uploaded image, and run the app (make sure you decide on the most logical order for these steps in your script).

What this script does NOT need to do:

Install AWS CLI
Run the aws configure command and log you in with your access credentials
Create a Bash script called revert-to-normal-homepage.sh to reverse all the changes made by your first script (make sure you decide on the most logical order for these steps in your script - think about it from your end users' experience).

Test to make sure:

You can alternate between running one script and the other continally, so that one makes the changes and the other reverse all the changes.
Make sure your scripts will work whether the app is running or not initially
Deliverables:

once you have finished the first script + you run it - post the link in the chat, wait for a thumbs up from your trainer
run your other script, post the link in the chat so can see it changed back, once you have another thumbs up from your trainer
documentation on how and WHY you completed the task - it should be ready to share on the screen for tomorrow 9:30am. Please include:
how S3 storage works to provide redundancy, high availability and helps with disaster recovery



---------------------------------------


# monitoring 

![alt text](image.png)