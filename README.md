### Expose client Docker Image
This Docker image is designed to run the Expose client, which allows you to share local services over the internet using the Expose server. The image is based on a lightweight Linux distribution and includes the necessary dependencies to run the Expose client.

**The config.php file is built with dns => true to support docker! Default value is 127.0.0.1.**

### Environment Variables
- `EXPOSE_SERVER_SCHEME`: The scheme of the Expose server (http or https).
- `EXPOSE_SERVER_HOST`: The host of the Expose server.
- `EXPOSE_SERVER_PORT`: The port of the Expose server.
- `EXPOSE_AUTH_TOKEN`: The authentication token for the Expose server.
- `EXPOSE_SUBDOMAIN`: The desired subdomain for the exposed service.
- `EXPOSE_SHARE_URL`: The local URL to be exposed.

### Run image

```bash
    docker run -d --name expose-client --network host -e EXPOSE_SERVER_SCHEME=https -e EXPOSE_SERVER_HOST=vinagidvama.com -e EXPOSE_SERVER_PORT=443 -e EXPOSE_AUTH_TOKEN=martin -e EXPOSE_SUBDOMAIN=martin -e EXPOSE_SHARE_URL=http://192.168.30.10:32768 --restart unless-stopped wizzyto12/expose-client:latest bash -c 'expose share $EXPOSE_SHARE_URL --subdomain=$EXPOSE_SUBDOMAIN -vvv'
```

### Build image
Build it
```bash
  docker build -t wizzyto12/expose-client .
```

Push it
```bash
  docker push wizzyto12/expose-client:latest
```
