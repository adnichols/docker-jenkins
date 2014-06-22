#!/bin/sh
#
# This file is for testing & development, if you want to use it to run this container be
# aware that it assumes some things about the docker host on which it runs such as:
# - The directory /docker-jenkins exists
# - The port 8080 is not already in use by something else

echo "Running Jenkins container"
docker run -d -p 8080:8080 -v "/docker-jenkins:/jenkins" --name jenkins anichols/jenkins 
