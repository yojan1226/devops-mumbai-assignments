#script that compare two strings provided as arguments and indicates if they are equal or different

read -p "Enter first string" string1
read -p "Enter second string" string2

if [ "$string1" = "$string2" ]; then

 echo "$string1 and $string2 are same"

else 

 echo "strings are not same"

fi