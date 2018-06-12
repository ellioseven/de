# Service: Node

- Image: https://hub.docker.com/r/ellioseven/de-node/
- Source: https://github.com/ellioseven/de-node
- Versions: https://hub.docker.com/r/ellioseven/de-node/tags/

This service is based from the official [Node](https://hub.docker.com/_/node/)
image. Differences include:

- An app user, which is mapped to UID 1000 for permission synchronisation
- Global packages are installed to `/home/app/.npm-packages` with their binaries
  added to `$PATH`. These are mounted to `./lib/npm` on the host machine for
  persistance and is ignored by VCS.

**Note:** The official `node` image comes preinstalled with `yarn`

## Volumes

This service mounts the required `app` volume into `home/app/src`. Ensure that
`src/docroot` exists.
