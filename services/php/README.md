# Service: PHP

- Image: https://hub.docker.com/r/ellioseven/de-drupal/
- Source: https://github.com/ellioseven/de-drupal
- Versions: https://hub.docker.com/r/ellioseven/de-drupal/tags/

This service is based from the official [PHP](https://hub.docker.com/_/node/)
image. Differences include:

- An app user, which is mapped to UID 1000 for permission synchronisation
- Extra PHP extensions: `gd`, `mbstring`, `opcache`, `pdo`, `pdo_mysql`, `zip`
- Composer. More information below.
- Xdebug

## Volumes

This service mounts the required `app` volume into `home/app/src`. Ensure that
`src/docroot` exists.

## Composer

Global packages are installed to `/home/app/.composer` with their binaries added
to `$PATH`. These are mounted to `./lib/composer` on the host machine for
persistance and is ignored by VCS. `src/docroot/vendor/bin` has been added to
the path for the `app` user.

[prestissimo](https://github.com/hirak/prestissimo) has also been installed to
help speed up package install times.

**Note:** Binaries such as `drush` or `drupal-console` should be added installed
and managed by your build, not globally.

## SSH Agent

This services forwards your current active SSH agent into the container. You
must have your SSH agent available on your host machine:

```
ssh-add -D
ssh-add <path/to/private-key>
```

You may need to restart the environment containers.

## Extending

To extend the image, create `./etc/docker/Dockerfile`. The following example
installs extensions via `pecl` and `docker-php-ext`.

```
FROM ellioseven/de_drupal:<version>

# Install memcache via pecl
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    $PHPIZE_DEPS \
    zlib1g-dev \
  && rm -rf /var/lib/apt/lists/* \
  && pecl channel-update pecl.php.net \
  && pecl install memcache \
  && echo "extension=memcache.so" > /usr/local/etc/php/conf.d/memcache.ini \
  && apt-get purge -y --auto-remove \
    $PHPIZE_DEPS

# Install bundled opcache PHP extension.
RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		$PHPIZE_DEPS \
	&& rm -rf /var/lib/apt/lists/* \
	# Build PHP extensions. \
	&& docker-php-ext-install -j "$(nproc)" \
		opcache \
	# Remove build dependencies. \
	&& apt-get purge -y --auto-remove $PHPIZE_DEPS
```

Then update the service `docker-compose.yml`:

```
version: "2"
services:
  php:
    build: "./etc/docker/Dockerfile"
    # ...
```

## Drush Aliases

Any aliases should be added to `./etc/drush`, then update the service
`docker-compose.yml`:

```
version: "2"
services:
  php:
    volumes:
      - ./etc/php/drush:/home/app/.drush
      # ...
```
