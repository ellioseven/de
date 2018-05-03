# Service: Tunnel

- Image: https://hub.docker.com/r/ellioseven/de-tunnel/
- Source: https://github.com/ellioseven/de-tunnel

This image is based off [localtunnel](https://localtunnel.github.io/www/)

## Configuring a Tunnel

Tunnels should be managed in project root `docker-compose.override.yml`. To
configure a tunnel, specify the following:

```
version: "2"
services:
  tunnel:
    extends:
      file: ./services/tunnel/docker-compose.yml
      service: tunnel
    depends_on:
      - <service>
    environment:
      - LT_HOST=<service>
      - LT_PORT=<port>
      - LT_SUBDOMAIN=<subdomain>
```

Running `make up` will create the tunnel. You can view the tunnel status with
`docker-compose logs <tunnel-service>`

The tunnel should now be viewable at `<subdomain>.localtunnel.me`

### Replacements:

- `<service>` Service ID, eg: `apache`
- `<port>` Service port, eg: `80`
- `<subdomain>` Subdomain to be created, eg: `de-apache`
