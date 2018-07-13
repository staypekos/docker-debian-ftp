FROM debian:stable-slim
MAINTAINER Vit Pekarek <pekarek@vzs-jablonec.cz> 

ENV DEBIAN_FRONTEND noninteractive

# setup workdir
RUN mkdir -p /root/work/
WORKDIR /root/work/

# install git, git-ftp and lftp
RUN apt-get -y update && apt-get -qq install -y \
	git \
	git-ftp \
	lftp

# slim down image
RUN apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man/?? /usr/share/man/??_*

# disable certificat verification
RUN mkdir /root/.lftp 
COPY ./rc /root/.lftp/

# run a CMD to show git is installed
CMD git help
