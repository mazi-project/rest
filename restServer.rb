require 'sinatra'
require 'rubygems'
require 'mysql' 

set :bind, '10.64.45.206'
set :port, 8080



# view all
get "/user" do
print("hello user") 
end
get '/users' do
  begin 
    #connect to DATABASE mydb
    con = Mysql.new 'localhost', 'user', 'mavridis', 'mydb'
     
    #connect to table ONLINE
    rs = con.query("SELECT * FROM ONLINE")
    n_rows = rs.num_rows
     
    # Print all TABLE ONLINE
    #printf("There are #{n_rows} rows in the result set")
    print("+==+=========+==========================+=====+ \n") 
    print("|Id|   NAME  |           DATE           |USERS| \n")
    print("+==+=========+==========================+=====+ \n")

    n_rows.times do
#      print ("| ")
      print rs.fetch_row.join("|\s")
      print("\n")
#      print("+--+---------+--------------------------+-----+ \n")
    end
    
  rescue Mysql:: Error => e
    puts e.errno
    puts e.error
  ensure
    con.close if con
  end   
  
end

# create
post '/user' do
  
 begin 
   #connect to DATABASE mydb
   con = Mysql.new 'localhost', 'user', 'mavridis', 'mydb'
 
   #create TABLE ONLINE ==> | Id | Name | Date | Users |
   con.query("CREATE TABLE IF NOT EXISTS \
        ONLINE(Id INT PRIMARY KEY AUTO_INCREMENT,Name VARCHAR(10), Date CHAR(30) , Users CHAR(3))")
   
   #insert data into the TABLE ONLINE2
   con.query("INSERT INTO ONLINE(Name, Date, Users) VALUES('#{params[:Name]}','#{params[:Date]}','#{params[:Users]}')")
 rescue Mysql:: Error => e
   puts e.errno
   puts e.error
 ensure
   con.close if con
 end


end

# update
put '/user/:id' do
  
  return status 404 if user.nil?
  
  user.save
  status 202
end

delete '/user/:id' do
  
  return status 404 if user.nil?
  user.delete
  status 202
end























