# Service: MySQL

- Image: https://hub.docker.com/_/mysql/
- Source: https://github.com/docker-library/mysql
- Versions: https://hub.docker.com/r/library/mysql/tags/

This service uses the official [MySQL](https://hub.docker.com/_/mysql/) image.

## Volumes

This service mounts the data volume into from `./lib/mysql` on the host machine
to `/var/lib/mysql` in the container.

## Credentials

MySQL username is `root`, password is `root`.
