# Service: ngrok

- Image: https://hub.docker.com/r/ellioseven/de-ngrok/
- Source: https://github.com/ellioseven/de-ngrok

This image is based off [ngrok](hhttps://ngrok.com)

## Configuring a Tunnel

Tunnels should be managed in project root `docker-compose.override.yml`. To
configure a tunnel, specify the following:

```
version: "2"
services:
  ngrok:
    extends:
      file: ./services/tunnel/docker-compose.yml
      service: ngrok
    extra_hosts:
      - "<url>:127.0.0.1"
    environment:
      - NGROK_HOST=<service>
      - NGROK_PORT=<port>
```

Start the ngrok service:

```
make up
make SERVICE=tunnel host
```

Running `make up` will create the tunnel. The web interface should be viewable
at `<url>:4040`.

### Replacements:

- `<service>` Service ID, eg: `apache`
- `<port>` Service port, eg: `80`
- `<url>` Local URL to access ngrok web interface, eg: `ngrok.local`
