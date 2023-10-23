#!/bin/bash
#controll if a userlist.txt file is inside /tmp/
if [ ! -e /tmp/userlist.txt ]; then 
	touch /tmp/userlist.txt
else
	rm /tmp/userlist.txt
	touch /tmp/userlist.txt
fi
#fill userlist.txt with names from accounts that need to be made 
cat /labStuff/labExerciseScripts/Scripts/$1/"start"/userlist.txt >> /tmp/userlist.txt


#location of the txt file of usernames
userfile=/tmp/userlist.txt

#extracting usernames from the file one-by-one
username=$(cat /tmp/userlist.txt | tr 'A-Z'  'a-z')

#defining the default password
password=$username@123

#running loop  to add users
for user in $username;do
	
       #adding users '$user' is a variable that changes
       #usernames accordingly in txt file.
       useradd $user --badname	
	echo $password | passwd --stdin $user
done

#clean up the /tmp afterwards
rm /tmp/userlist.txt
