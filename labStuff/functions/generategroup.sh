#!/bin/bash
#controll if a grouplist.txt file is inside /tmp/
if [ ! -e /tmp/grouplist.txt ]; then
        touch /tmp/grouplist.txt
else
        rm /tmp/grouplist.txt
        touch /tmp/grouplist.txt
fi
#fill userlist.txt with names from accounts that need to be made
cat /labStuff/labExerciseScripts/Scripts/$1/"start"/grouplist.txt >> /tmp/grouplist.txt


#location of the txt file of usernames
groupfile=/tmp/grouplist.txt

#extracting usernames from the file one-by-one
groupname=$(cat /tmp/grouplist.txt | tr 'A-Z'  'a-z')

#defining the default password

#running loop  to add users
for group in $groupname;do

       #adding users '$user' is a variable that changes
       #usernames accordingly in txt file.
       groupadd $group

done

#clean up the /tmp afterwards
rm /tmp/grouplist.txt
