#list the running process and thier pids

command=$(ps -eo pid,comm)

echo "Here is the running process along with thier PIDS $command"