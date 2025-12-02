 ## documentation for DB script issues I faced.


##### Mongod wasn't starting when script was running

* Before:
> sudo sed -i "s/^  bindIp: .*/  bindIp: 0.0.0.0/" /etc/mongod.conf

* After: 
> sudo sed -i 's/bindIp: .*/bindIp: 0.0.0.0/' /etc/mongod.conf

 I changed the "" into '' instead and I also had to remove the ^ symbol. in the config file for mongod the spacing/syntax was all wrong and not the correct format that a YAML file needed to run/work therefore causing it to crash. due to this I had to fix the spacing and syntax and remove some symbols fixing the overall DB issues.