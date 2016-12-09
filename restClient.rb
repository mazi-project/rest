require 'json'
require 'rubygems'
require 'rest-client'


# RASPBERRY NEME AND SERVER IP
ip = 192.168.1.7
name = rasp_john

#READ FILE FUNCTION
def read_file(file_name)
  file = File.open(file_name, "r")
  data = file.read
  file.close
  return data
end

# READ ONLINE USERS 
online = read_file("/home/pi/mazi/online.txt")

puts "online user is #{online}"

# DATE  
date =  Time.now.inspect


response = RestClient.post "http://#{ip}:8080/user", :Name => name, :Date => date, :Users => online


