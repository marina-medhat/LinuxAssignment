#!/bin/bash
#echo $USER
MyTrash=/home/$USER/TRASH/

#Check if the Trach already exist or Not

if ! [ -d "$TRASH" ]
then 
mkdir $MyTrash
fi

# $# : returnnumber of arguments 

#First Case The User Did not write any files 
if [ $# -eq 0 ]
then 
echo Take Care You Did not pass Any File To compress and move it to TRASH
echo So You Must Write Files you want to compress and move to TRASH 
echo For Example: ./sdel.sh [file1] [file2] ... [fileN]
fi


#Second Case 
for i in $*
do 
if [ -f "$i" ]
then 

if !(file $i | grep -q compressed )
then 

tar czf $i.tar.gz $i
sudo mv $i.tar.gz $MyTrash
else
echo "$i is Compressed"
sudo mv $i $MyTrash 
fi

else
echo "$i is not exist! .. No such File !!"
fi

done

result=$(find $MyTrash -name "*" -type f -atime +2) 
if [ -z "$result" ]
then 
echo 'There Are No Files In Trach for more Than 48 h'

else
echo "$result"
echo 'Were In Trach for more Than 48 h and Deleted'
find $MyTrash -name "*" -type f -atime +2 -delete
fi




