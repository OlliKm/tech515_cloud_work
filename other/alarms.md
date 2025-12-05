# Breakdown and walkthrough of setting up a cpu usage alarm notification.

ab -n 1000 -c 100 http://34.247.50.173/


# How to setup an alarm when cpu usage is reached
**Step 1**
  
1. on your instance that you made scroll down amd you will see a menu that says status and alarms.
2. when you have selected that it should come up with a screen similar to the image below, if so select the blue actions button and click on **Create status check alarm**
![alt text](/Images/image-3.png)

**Step 2**
1. It should open a page asking you to either create or edit an exist alarm for this test we will be creating one.
2. following the instructions in the alarm notification box we will just type the name that we want the alarm under use the standard naming convention
   
![alt text](/Images/image-4.png)
Scrolling just below
1. name the alarm and description 
2. and set the period to the desired period 
3. we want to change the **Type of data to sample** to CPU Usage 
4. then click create

![alt text](/Images/image-5.png)

**Back on instance Page** 
1. go under the option of **status and alarms** and click on the Name section of the alarm you have just made.
![alt text](/Images/image-6.png)
**Editing Data**
1. now that you are able to see some basic data you want to click the **Actions** button and click **Edit**
![alt text](image-7.png)

**Specify metric conditions**
for this page we will be naming and configing our data
1. rename the Metric name to something approriate and make sure that it has the correct instance ID of the instance you are testing/making this for.
2. keep statistic to **Average** and change the period to 1 minute
3. if you scroll down it will allow you to set the conditons.

![alt text](/Images/image-8.png)
1. setting the conditions is easy we just want to keep it **Static** 
2. we then want ot make sure that the **Greater/Equal** to Cpu Utilization is selected as this will make is soo if the cpu usage is more or equal to our selected value it will go off. 
3. We then want to define what we want our value as for this we will be selecting a threshold value of 15 
![alt text](/Images/image-9.png)
**Step 2**
for this page we will be setting it up so when the alarm goes off an email is sent out.
1. To do this we need to make sure the **In Alarm** trigger is selected
2. then make sure you are clicking **Create a new Topic** 
3. When you click on that it should come up with 2 boxes to,
   * Type in a Topic Name
   * Type in an email to get the notifications from when alerts happen
4. once done just click continue

![alt text](/Images/image-10.png)

**Alarm Details**
This page just allows you to edit the alarm description when viewing the alarm in a console
1. add a description if you want one
2. if not click next
![alt text](/Images/image-11.png)
**Once down you should have a preview page if all info is correct just click create**

## Once all of that is created
 you can just load onto your VM and run 
> ab -n 1000 -c 100 http://vm's-public-ip/

which will simulate a thousand requests on your home page and will provide result on the monitoring tab as well as sent out a notification email like the image below

**Notification Example**
![alt text](/Images/image.png)