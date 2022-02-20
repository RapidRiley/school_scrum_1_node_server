#!/bin/bash
# Author: Riley Warps

# Port the container uses to host the app.
port=4000

docker build --build-arg SERVER_PORT=${port} -t raw_data_server .

if [ $? ] 
then
    docker run --rm -p ${port}:${port} raw_data_server
fi