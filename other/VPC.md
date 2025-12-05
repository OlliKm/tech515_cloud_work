# VPC

- [VPC](#vpc)
- [Customer Architecture for sparta app](#customer-architecture-for-sparta-app)
- [How to make your working VPC](#how-to-make-your-working-vpc)
- [step 1 make your vpc](#step-1-make-your-vpc)
- [step 2 make your subnet](#step-2-make-your-subnet)
- [step 3 make the intenet gateway](#step-3-make-the-intenet-gateway)
- [step 5 make  the route table](#step-5-make--the-route-table)
- [How to remove everything correctly](#how-to-remove-everything-correctly)
- [security groups](#security-groups)



```
#### Run down on IPv4
Private ip's start with: 
* 10.x.x.x
* 192.168.x.x
* 172.16.x.x - 17.31.x.x
  
Any other ip that doesn't start with either of that is public
```

* Here is an example diagram explaining how VPC's and subnets work and the uses of both private and public
  
they are similar to a building and the flats within a building 
with the different floors being the custom vpc made .
with the top floor the default are the basic subnets for A,B,C  which are public
> VPC Diagram
 ![](/Images/vpc%20diagram.png)
> VPC Diagram



# Customer Architecture for sparta app

Heres the customer architecture diagram explaining how the process of internet use to a app page works and how they can only access the app and not the database as that is a private subnet being its blocked off from the internet 
using security groups and routers to direct the users
![](/Images/custom%20architecture%20diagram.png)


**NAT - NETWORK ADDRESS TRANSLATION**
allows database to go through nat to get internet access so it can preform updates and downloads - maybe preformed temporary.

**How to access and SSH into the private DB**
if we ssh into the app vm we can **Jumpbox** into the db vm by ssh with the private ip.


**Bastion server** - allows us to ssh into a Private subnet -allowing connections to machines on public networks.- most times they cost

# How to make your working VPC
 
# step 1 make your vpc 
![alt text](/Images/image-2.png)
use 10.0.0.0/16 instead 

# step 2 make your subnet
![alt text](/Images/image-5.png)
![alt text](/Images/image-6.png)

# step 3 make the intenet gateway
![alt text](/Images/image-7.png)

# step 5 make  the route table
![alt text](/Images/image-1.png)


# How to remove everything correctly 

1. remove virtual machines first
2. remove security groups
3. remove the VCP and it will remove everything thats inside like subnet's and round tables and internet gateways.

# security groups 
specify the apps security group so only the app is allowed in to the db increases security 
so does removing the db public Ip
And so does limiting the access to own IP only
