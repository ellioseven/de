# Service: Solr

- Image: https://hub.docker.com/_/solr/
- Source: https://github.com/docker-solr/docker-solr
- Versions: https://hub.docker.com/r/library/solr/tags/

This service uses the official [Solr](https://hub.docker.com/_/solr/) image.

## Volumes

This service mounts the data volume into from `./lib/solr` on the host machine
to `/opt/solr/server/solr/drupal` in the container.

## Solr Cores

A `drupal` core will be created on container initialisation if one doesn't
exist already.
