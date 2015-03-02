#Dockerfile
FROM phusion/baseimage:0.9.15
MAINTAINER marc brown <marc@22walker.co.uk> v0.3.2
#COUCHPOTATO port for web access
ENV COUCHPORT 7962
EXPOSE COUCHPORT
#folder mount points
VOLUME ["/home/media/films"]
VOLUME ["/home/backups/couchpotato"]
VOLUME ["/home/downloads/completed/tv"]
VOLUME ["/home/downloads/completed/films"]
VOLUME ["/home/downloads/ongoing"]

## Set working directory
WORKDIR /opt

## Install prerequisites
RUN apt-get upadte && apt-get install -y python git-core

## Install Couchpotato
RUN git clone https://github.com/RuudBurger/CouchPotatoServer.git

## Run Couchpotato
ENTRYPOINT ["python", "CouchPotatoServer/CouchPotato.py"]
