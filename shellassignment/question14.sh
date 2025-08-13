#Write a script to replace all occurrences of one word with another
#throughout data.txt.

read -p "Enter a new string" newword
read -p "Enter a old string" oldword

sed -i "s/$oldword/$newword/g" file.txt

echo "All occurrences of '$oldword' have been replaced with '$newword' in file.txt"