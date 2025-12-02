## Automate deployment with user data

### what to expect when launching the app VM with user data

1. An error
2. Nginx default page
3. when reverse proxy is doing its job(sending the user to port 3000) - bad gateway error
4. App should display when you refresh


## overview of the automation levels
![alt text](<script to ami's.png>)


## Plan to create and test AMI's 

1. deploy app with /posts working(meaning app and DB have all dependencies )
2. Create DB AMI
3. Create app AMI
4. Test AMI's just created
5. Created DB VM using DB AMI
6. Create app VM using the app VMI(with little user data)
7. terminate
   1. original app & db vm's we used to create the AMI
   2. New app and DB VM's that used the new AMI's 
