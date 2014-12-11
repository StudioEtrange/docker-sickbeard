# docker sickbeard by StudioEtrange

* Run sickbeard inside a docker container built upon debian
* Based on sickbeard github source code
* Choice of sickbeard version
* Use supervisor to manage sickbeard process
* By default sickbeard configuration files will be in /data/sickbeard


## Sample Usage

for running latest stable version of sickbeard :

	docker run -d -v $(pwd):/data -p 8081:8081 studioetrange/docker-sickbeard:latest

then go to http://localhost:8081

## Version and Tag

* docker-tag:latest ==> latest stable sickbeard version available through this repository
* github-branch:master ==> work in progress based on latest stable sickbeard version available through this repository
* docker-tag:ver connected to github-branch:ver  ==> sickbeard version ver
* docker-tag:dev connected to github-branch:dev ==> development version from sickbeard git repository

In dev case, to have an uptodate image you should
* build the docker image yourself (see build from github souce below)
* OR launch in the container the script /opt/sickbeard-update.sh

## Instruction 

### build from github source

	git pull https://github.com/StudioEtrange/docker-sickbeard
	cd docker-sickbeard
	docker build -t=studioetrange/docker-sickbeard .

### retrieve image from docker registry

	docker pull studioetrange/docker-sickbeard

### run sickbeard 

	docker run -v DATA_DIR:/data -p SICKBEARD_HTTP_PORT:8081 -p SUPERVISOR_HTTP_WEB:9999 studioetrange/docker-sickbeard:SICKBEARD_VERSION

### run sickbeard daemonized

	docker run -d -v DATA_DIR:/data -p SICKBEARD_HTTP_PORT:8081 -p SUPERVISOR_HTTP_WEB:9999 studioetrange/docker-sickbeard:SICKBEARD_VERSION


### run a shell inside this container (without sickbeard running)

	docker run -i -t studioetrange/docker-sickbeard

## Access point

### Sickbeard

	Go to http://localhost:SICKBEARD_HTTP_PORT/

### Supervisor

	Go to http://localhost:SUPERVISOR_HTTP_WEB/
