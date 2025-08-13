
# Prompt for directory to back up
read -p "Enter the directory path to back up: " source_dir

# Check if directory exists
if [ ! -d "$source_dir" ]; then
    echo "Directory does not exist!"
    exit 1
fi

# Create backups folder if not exists
backup_dir="$HOME/backups"
mkdir -p "$backup_dir"

# Create timestamp
timestamp=$(date +"%Y%m%d_%H%M%S")

# Create backup filename with timestamp
backup_file="$backup_dir/backup_${timestamp}.tar.gz"

# Create compressed archive
tar -czf "$backup_file" -C "$(dirname "$source_dir")" "$(basename "$source_dir")"

# Confirm success
if [ $? -eq 0 ]; then
    echo "Backup created successfully: $backup_file"
else
    echo "Backup failed!"
fi
