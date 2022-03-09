# Author: Riley Warps

# Port the container uses to host the app.
$port = 4000

docker build --build-arg SERVER_PORT=${port} -t school_scrum_1_node_server .

if($?) 
{
    docker run -d --rm -p ${port}:${port} --mount "type=volume,src=cern_data,dst=/data" --name school_scrum_1_node_server -t school_scrum_1_node_server
}