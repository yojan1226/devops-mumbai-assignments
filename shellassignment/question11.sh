#11. Create a script that searches for a specific string within a file or directory
#recursively.



read -p "Enter a string" string

v=/home/honey/linux

command=$(grep -r "$string" $v)

echo "these string is present in $command"