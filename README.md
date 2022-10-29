https://fastapi.tiangolo.com/deployment/docker/

# docker build tag <image_name> <docker_file_path>
docker build -t fast-api:v1.0.0 .

# docker run daemon mode(Run container in background and print container ID) --name (container name) image_name
docker run -d --name fastapi -p 80:80 fast-api:v1.0.0

# In order to execute commands on running containers, you have to execute “docker exec” and specify the container name (or ID) as well as the command to be executed on this container
# https://devconnected.com/docker-exec-command-with-examples/
docker exec -it fastapi sh

# Command to stop & remove running container
docker rm -f fastapi