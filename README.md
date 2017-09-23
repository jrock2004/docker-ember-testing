# Docker Image for Ember Testing
This Docker image, will setup a system so your ember tests can be executed inside the container itself.

## How it works
In your docker-compose you can specify this image, and for volumes, you will want to mount your local directory that has the ember app in it. Example

```
VOLUMES:
  - .:/app
```

You can also just run it via the command

```
docker run --rm -v "$PWD":/app
```

## Ember version
When pulling the latest, it will pull the latest version of ember cli
