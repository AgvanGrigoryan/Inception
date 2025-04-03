FROM debian:bullseye

ARG PHP_VERSION

ENV PHP_VERSION=${PHP_VERSION}

COPY conf/wp-config.php /var/www/wordpress/wp-config.php

RUN apt update -y && apt install -y sudo

RUN apt update -y && apt upgrade -y \
    && apt install -y \
	wget \
	curl \
	unzip \
	gettext \
	mariadb-client \
	gnupg2 \
	lsb-release \
	ca-certificates \
	apt-transport-https \
    && rm -rf /var/lib/apt/lists/*

RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list \
    && wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add - \
    && apt update

RUN apt install -y \
	php${PHP_VERSION} \
	php${PHP_VERSION}-fpm \
	php${PHP_VERSION}-mysql \
	php${PHP_VERSION}-curl \
	php${PHP_VERSION}-xml \
	php${PHP_VERSION}-mbstring \
	php${PHP_VERSION}-zip \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php \
    && chown -R www-data:www-data /run/php

COPY conf/www.conf /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf.template

WORKDIR /var/www/wordpress

RUN wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
	tar -xzf /tmp/wordpress.tar.gz -C /var/www/wordpress --strip-components=1 && \
	rm /tmp/wordpress.tar.gz

RUN echo "variables_order = \"EGPCS\"" >> /etc/php/${PHP_VERSION}/cli/php.ini

RUN chown -R www-data:www-data /var/www/wordpress

EXPOSE 9000

COPY tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"] # replace CMD to ENTRYPOINT if it alowed by subject

