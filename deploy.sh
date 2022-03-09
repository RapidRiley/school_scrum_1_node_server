#!/bin/bash
# Author: Riley Warps

# Port the container uses to host the app.
port=4000

docker build --build-arg SERVER_PORT=${port} -t node_server .

if [ $? ] 
then
    docker run --rm -p ${port}:${port} node_server
fi