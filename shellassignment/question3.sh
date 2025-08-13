path=$(pwd)

read -p "Enter file name that you want to copy" filename

f=$(find . -name "$filename")   #find the file in the current directory

if [ ! -f $filename ]; then   #if these statement is incorrect that it print the source path is invalid

 echo "source path is invalid"

else
 
 cp /home/honey/linux/shellscripting/shellassignment/$filename /home/honey/linux/shellscripting/
 echo "the file is copied to destination path"

fi