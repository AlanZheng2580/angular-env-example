# Angular Environment Example

This project demonstrates how to use Angular's built-in environment files for staging and production when building a Dockerized application.

## Building the Docker Images

To build the staging image, run:

```bash
DOCKER_BUILDKIT=0 docker build -f Dockerfile.staging -t angular-env-staging .
```

To build the production image, run:

```bash
DOCKER_BUILDKIT=0 docker build -f Dockerfile.prod -t angular-env-prod .
```

## Running the Docker Containers

To run the staging container:

```bash
docker run -rm -p 8083:80 --name angular-staging-app angular-env-staging
```

To run the production container:

```bash
docker run --rm -p 8084:80 --name angular-prod-app angular-env-prod
```

After running the container, you can access the staging application at `http://localhost:8080` and the production application at `http://localhost:8081`.
