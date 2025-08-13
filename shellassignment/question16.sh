
read -p "Enter a specific pattern: " pattern

# Check if file exists
if [ ! -f "file.txt" ]; then
    echo "file.txt file not found!"
    exit 1
fi

# Search and print
grep -i "$pattern" file.txt | while read -r line; do
    echo "Matched Line: $line"
    echo "Custom Message: This line contains the pattern '$pattern'"
    echo "----------------------------------------"
done
