FROM studioetrange/docker-debian:wheezy
MAINTAINER StudioEtrange <nomorgan@gmail.com>


# DEBIAN packages : SICKBEARD dependencies install ----------
RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
						python-cheetah \
	&& rm -rf /var/lib/apt/lists/*
	

# SICKBEARD install -------------
ENV SICKBEARD_VERSION development

RUN git clone https://github.com/midgetspy/Sick-Beard && git checkout $SICKBEARD_VERSION

# SICKBEARD bleeding edge update
COPY sickbeard-bleeding-edge.sh /opt/sabnzbd/sickbeard-bleeding-edge.sh

# SUPERVISOR -------------
COPY supervisord-sickbeard.conf /etc/supervisor/conf.d/supervisord-sickbeard.conf

# DOCKER -------------
VOLUME /data

# Supervisord web interface -------
EXPOSE 9999
# sickbeard http port
EXPOSE 8081

# entrypoint
ENTRYPOINT ["/opt/sickbeard/sickbeard-bleeding-edge.sh"]

# run command by default
CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf", "-n"]
