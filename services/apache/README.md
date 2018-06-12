# Service: Apache

- Image: https://hub.docker.com/r/ellioseven/de-apache
- Source: https://github.com/ellioseven/de-apache
- Versions: https://hub.docker.com/r/ellioseven/de-apache/tags/

This service is based from the official [Apache](https://hub.docker.com/_/httpd/)
image. Differences include:

- An app user, which is mapped to UID 1000 for permission synchronisation
- Configured for use with PHP-FPM to a `php` host
- Web root located at `/home/app/src/docroot`

## Volumes

This service mounts the required `app` volume into `home/app/src`. Ensure that
`src/docroot` exists.
