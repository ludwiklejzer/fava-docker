# fava-docker

A Dockerfile for [beancount-fava](https://github.com/beancount/fava).

## Usage Example

You can run this image via:

### Docker Cli

```bash
docker run -d \
  --name fava \
  --restart unless-stopped \
  -p 5000:5000 \
  -v $PWD:/data \
  -e BEANCOUNT_FILE="/data/example.beancount" \
  ghcr.io/ludwiklejzer/fava-docker:latest
```

### Docker Compose

```yml
services:
  fava:
    container_name: fava
    build: https://github.com/ludwiklejzer/fava-docker.git#main
    ports:
      - "5000:5000"
    volumes:
      - ${PWD}:/data
    environment:
      - BEANCOUNT_FILE=/data/example.beancount # path to your beancount file
    restart: unless-stopped
```
