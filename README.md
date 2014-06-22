# docker-jenkins

Sets up a container with jenkins installed listening on port 8080. This
fork also includes git. This setup is a bit opinionated and will
probably become moreso over time

## Usage

To run the container, do the following:

```
docker run -d -P --name jenkins anichols/jenkins

docker ps
CONTAINER ID        IMAGE                       COMMAND                CREATED             STATUS              PORTS                     NAMES
1131d37c38b1        anichols/jenkins:latest    java -jar /opt/jenki   12 seconds ago      Up 12 seconds       0.0.0.0:49153->8080/tcp   drunk_fermi
```

Your jenkins instance is now available by going to http://localhost:49153

Generally you'll want Jenkins bound to a static port so you can run with
`-p 8080:8080` for example to always run on port 8080

#### Data persistence
By default this is a basic Jenkins installation which doesn't contain
many plugins. It is strongly recommended that you setup a persistent
data volume for Jenkins so that you can upgrade this container and
maintain your existing Jenkins configurations & plugins. The easiest way
to do this is to bind mount the directory `/jenkins` inside the
container to a directory on the Docker host. 

```
mkdir -p /docker-jenkins

docker run -d -p 8080:8080 -v '/docker-jenkins:/jenkins' --name jenkins
anichols/jenkins
```

This will persist all Jenkins configurations & plugins in a directory
named /docker-jenkins on the Docker host. You can backup this directory
if you choose or use one of the Jenkins backup plugins. 

#### Java tuning
You may pass java arguments using the `JAVA_OPTS` environment variable.
This is optional, but if you need to tune memory parameters you can do
so:

```
docker run -e 'JAVA_OPTS="-Xmx=512m,-Xms=256m"' anichols/jenkins
```

#### Jenkins management
This fork should allow jenkins to properly restart inside the container
however if you want to stop/restart the container you can do so using
docker:

To Stop:
`docker stop jenkins`

To Restart:
`docker restart jenkins`

To view Jenkins logs:
`docker logs jenkins`

#### Container upgrades
If you persist your Jenkins configuration on a volume outside the docker
container then you can upgrade the container without losing any of your
plugins/configuration. If you did not map your /jenkins directory to a
persistent volume then this upgrade process will DESTROY all your
Jenkins configurations & plugins. 

If you want to upgrade the container it should be pretty simple:

```
docker stop jenkins
docker rm jenkins
docker pull anichols/jenkins
docker run -d -p 8080:8080 -v '/docker-jenkins:/jenkins' --name jenkins
anichols/jenkins
```

## Building

To build the image, simply invoke

    docker build github.com/adnichols/docker-jenkins

A prebuilt container is also available in the docker index

    docker pull anichols/jenkins


## Author

  * Aaron Nichols (<anichols@trumped.org>)
  * Allan Espinosa (<allan.espinosa@outlook.com>) - original author
  * Gwenn Etourneau

## LICENSE

Copyright 2014 Aaron Nichols

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
