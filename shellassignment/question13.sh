
read -p "Enter hour (0-23): " hour
read -p "Enter minute (0-59): " minute
read -p "Enter full command to run: " command

# Add cron job
(crontab -l 2>/dev/null; echo "$minute $hour * * * $command") | crontab -

echo "Cron job scheduled: $minute $hour * * * $command"
echo "To see your cron jobs: crontab -l"
