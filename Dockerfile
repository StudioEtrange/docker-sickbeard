FROM debian:wheezy
MAINTAINER StudioEtrange <nomorgan@gmail.com>

# Debian package & stuff -------------

RUN echo "deb http://http.debian.net/debian wheezy non-free" >> /etc/apt/sources.list \
	&& echo "deb http://http.debian.net/debian wheezy-updates non-free" >> /etc/apt/sources.list

# DEBIAN packages
RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
						supervisor \
						curl \
	&& rm -rf /var/lib/apt/lists/*

# DEBIAN packages : SICKBEARD dependencies install ----------
RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
						python \
						python-cheetah \
	&& rm -rf /var/lib/apt/lists/*
	

# SICKBEARD install -------------
ENV SICKBEARD_VERSION development

RUN mkdir -p /opt/sickbeard

RUN curl -k -SL "https://github.com/midgetspy/Sick-Beard/archive/$SICKBEARD_VERSION.tar.gz" \
	| tar -xzf - -C /opt/sickbeard --strip-components=1


# PURGE -------------

RUN apt-get purge -y --auto-remove curl \
	&& rm -rf /var/lib/apt/lists/*

# SUPERVISOR -------------
COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY supervisord-sickbeard.conf /etc/supervisor/conf.d/supervisord-sickbeard.conf

# DOCKER -------------
VOLUME /data

# Supervisord web interface -------
EXPOSE 9999
# sickbeard http port
EXPOSE 8081

# run command by default
CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf", "-n"]