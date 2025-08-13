#Print only the lines from data.txt where the second field is a number greater
#than 10. Use awk command.

read -p "Enter a filename" filename

command=$(awk '$2 > 10' $filename)

echo "here is the result $command"