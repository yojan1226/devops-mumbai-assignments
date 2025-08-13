#check if a given file has read, write and execute permissions for the owner

read -p "Enter the filename" filename

read=$(stat -c "%A" $filename)
write=$(stat -c "%A" $filename)
execute=$(stat -c "%A" $filename)
all=$(stat -c "%A" $filename)

if [ "$all" = "-rwxr--r--" ]; then

 echo "the owner have all the permissions"

elif [ "$read" = "-r--r--r--" ]; then

 echo "the owner have only read permision"

elif [ "$write" = "--w-r--r--" ]; then

 echo "the owner have only write permision"

elif [ "$execute" = "---xr--r--" ]; then

 echo "the owner have only execute permision"

elif [ "$read" = "-rw-r--r--" ] && [ "$write" = "-rw-r--r--" ]; then

 echo "the owner have only read and write permission"

elif [ "$read" = "-r-xr--r--" ] && [ "$execute" = "-r-xr--r--" ]; then

 echo "the owner have only read and execute permision"

elif [ "$write" = "--wxr--r--" ] && [ "$execute" = "--wxr--r--" ]; then

 echo "the owner have only write and execute permision"

else

 echo "the owner haven't any permision *****Access denied*****"

fi