#!/bin/bash

# Function to output system information to log file
log_system_info() {
    # Time-stamp for logging
    timestamp=$(date +"%Y-%m-%d %T")

    # Write to log file
    echo "Timestamp: $timestamp" >> Automation.log
    echo "---------------------------------------" >> Automation.log

    # a) Users currently logged in
    echo "Users Currently Logged In:" >> Automation.log
    who >> Automation.log
    echo "" >> Automation.log

    # b) Current processes with other options
    echo "Current Processes:" >> Automation.log
    ps aux >> Automation.log
    echo "" >> Automation.log

    # c) Top 4 CPU utilizing processes
    echo "Top 4 CPU Utilizing Processes:" >> Automation.log
    ps -eo pid,%cpu,command --sort=-%cpu | head -n 5 >> Automation.log
    echo "" >> Automation.log

    # d) Devices plugged in (e.g., USB)
    echo "Devices Plugged In (USB):" >> Automation.log
    lsusb >> Automation.log
    echo "" >> Automation.log

    # e) Disk usage
    echo "Disk Usage:" >> Automation.log
    df -h >> Automation.log
    echo "" >> Automation.log

    # f) Network interfaces and their states
    echo "Network Interfaces and Their States:" >> Automation.log
    ifconfig -a >> Automation.log
    echo "" >> Automation.log


}

# Call the function to log system information
log_system_info
