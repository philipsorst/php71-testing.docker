FROM ubuntu:18.04
MAINTAINER Philip Washington Sorst <philip@sorst.net>

#Set Timezone
RUN echo "Europe/Berlin" > /etc/timezone
RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime

# Update
RUN apt-get update

# Install packages
RUN apt-get install -qy \
        php7.2-cli \
	php7.2-xml \
	php7.2-sqlite3 \
	php7.2-zip \
	php7.2-mbstring \
	php7.2-curl \
	php7.2-gd \
	composer \
	librsvg2-bin \
	npm

# Install yarn
RUN npm -g install yarn

# Cleanup
RUN apt-get clean
