# REST
guide of rest code


# Requirements 

* Raspberry pi
* INURA image . You can download from this link http://nitlab.inf.uth.gr/mazi-img/
* Internet connection

# Set up

**Download REST code**                                                                                                           
 sudo git clone https://github.com/mazi-project/rest.git

**Install ruby and gem rest-client**                                                                                         
 sudo apt-get install ruby                                                                                                   
 sudo apt-get install ruby-dev                                                                                               
 sudo gem install rest-client

**Set name of your Raspberry pi**                                                                                             
 sudo nano restClient.rb
                 

# Description

With the Rest API we can transfer data from one device to another threw internet.
More specifically from one client (raspberry pi) we can transfer data sach as name
date and online users to a server which can keep them to a DataBase. Also every client
will can restore the elements which there an in the DataBase.

**client side**                                                                                                               
Post data to the Server                                                                                                       
sudo ruby restClient.rb                                                                                                       

Get data from the Server                                                                                                     
GET 10.64.45.206:8080/users

![untitled 1](https://cloud.githubusercontent.com/assets/17981858/21064439/6aec90fe-be63-11e6-9c4a-f4de9260bfd1.jpg)
