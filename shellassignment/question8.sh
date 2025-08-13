#!/bin/bash

read -p "Enter PID: " PID

# Check if process exists
if ps -p "$PID" > /dev/null 2>&1; then
    kill "$PID" 2>/dev/null

    if [ $? -eq 0 ]; then
        echo "Successfully terminated process with PID $PID"
    else
        echo "Failed to terminate process with PID $PID (permission issue or already stopped)"
    fi
else
    echo "PID $PID not found."
fi
