path=$(pwd)

read -p "Enter a folder name" foldername
read -p "Enter first file" file1
read -p "Enter second file" file2
read -p "Enter third file" file3


m=$(mkdir $foldername)
cd $foldername
touch $file1
touch $file2
touch $file3
l=$(ls)


echo "the folder $foldername is created successfully in $path"
echo "three files are created in $foldername"
echo "these are the contents $l" 

