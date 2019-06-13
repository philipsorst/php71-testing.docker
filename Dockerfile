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
	php7.2-mysql \
	php7.2-zip \
	php7.2-mbstring \
	php7.2-curl \
	php7.2-gd \
	php7.2-intl \
	php7.2-redis \
	curl \
	rsync \
	composer \
	librsvg2-bin \
	fonts-ubuntu \
	npm

# Install deployer
RUN curl -L https://deployer.org/deployer.phar > /usr/local/bin/deployer && chmod +x /usr/local/bin/deployer

# Update node and install yarn
RUN npm cache clean -f && npm install -g n && n lts && npm install -g npm && npm install -g yarn

# Cleanup
RUN apt-get clean
