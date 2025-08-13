#checks the file is a regular file or directory

read -p "Enter a filename" filename

if [ -e "$filename" ]; then

 echo "yes $filename exist"

     if [ -f "$filename" ]; then
      
       echo "it is a regular file"

     elif [ -d "$filename" ]; then

       echo "it is a directory"

     else 

       echo "Not a directory and not a regular file"

     fi

else
  
 echo "$filename not exist"

fi