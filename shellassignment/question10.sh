#10. Write a script that counts the number of words, lines, and characters in a
#given text file.

read -p "Enter a filename" filename

word=$(wc -w $filename)
lines=$(wc -l $filename)
characters=$(wc -m $filename)

echo "the numbers of words is $word"
echo "the numbers of lines is $lines"
echo "the numbers of characters is $characters"