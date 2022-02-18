#!/bin/bash

# Intervals are in seconds
min_time_interval=20 # 20 seconds
max_time_interval=14400 # 4 hours


echo "Minimum interval in seconds: $min_time_interval"
echo "Maximum interval in seconds: $max_time_interval"

while true 
do 
    python /app/generator.py
    interval=$(shuf -i $min_time_interval-$max_time_interval -n 1)
    echo "Batch created, sleeping for $interval seconds"
    sleep "$interval"
done
