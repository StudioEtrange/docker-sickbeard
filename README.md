# NOT maintained : use https://github.com/StudioEtrange/docker-medusa instead

# docker sickbeard by StudioEtrange

* Run sickbeard inside a docker container built upon debian
* Based on sickbeard github source code
* Choice of sickbeard version
* Use supervisor to manage sickbeard process
* By default sickbeard configuration files will be in /data/sickbeard _(You should map a docker volume to /data)_


## Sample Usage

for running latest stable version of sickbeard :

	docker run -d -v $(pwd):/data -p 8081:8081 studioetrange/docker-sickbeard:latest

then go to http://localhost:8081

## Docker tags

Available tag for studioetrange/docker-sickrage:__TAG__

	latest, 507, 506, 505, 504

Current latest tag is version __507__

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

	docker run -i -t studioetrange/docker-sickbeard bash

## Access point

### Sickbeard

	Go to http://localhost:SICKBEARD_HTTP_PORT/

### Supervisor

	Go to http://localhost:SUPERVISOR_HTTP_WEB/

## Notes on Github / Docker Hub Repository

* This github repository is linked to an automated build in docker hub registry.

	https://registry.hub.docker.com/u/studioetrange/docker-sickrage/

* _update.sh_ is only an admin script which update and add new versions. This script do not auto create missing tag in docker hub webui. It is only for admin/owner purpose.
