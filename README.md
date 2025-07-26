# Angular Environment Example

This project demonstrates how to use Angular's built-in environment files for staging and production when building a Dockerized application.

## URL Prefix Configuration

This application is configured to be served under the `/tpor/` URL prefix. This is hardcoded in the `angular.json` for the Angular build process and in the `nginx.conf` for the Nginx server.

**To change the URL prefix (e.g., from `/tpor/` to `/new-prefix/`):**

1.  **Modify `angular.json`**: Update the `baseHref` property in the `build` configurations (e.g., `production`, `staging`) to the new prefix.
    ```json
    "configurations": {
      "production": {
        "baseHref": "/new-prefix/",
        // ... other settings
      },
      "staging": {
        "baseHref": "/new-prefix/",
        // ... other settings
      }
    }
    ```
2.  **Modify `nginx.conf`**: Update the `location` block to the new prefix.
    ```nginx
    location /new-prefix/ {
      alias /usr/share/nginx/html/;
      index index.html index.htm;
      try_files $uri $uri/ /new-prefix/index.html;
    }
    ```
3.  **Modify `src/environments/*.ts`**: Update the `urlPrefix` property in your environment files.
    ```typescript
    export const environment = {
      production: false,
      greeting: 'Hello from local environment!',
      urlPrefix: '/new-prefix/'
    };
    ```

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
docker run --rm -p 8083:80 --name angular-staging-app angular-env-staging
```

To run the production container:

```bash
docker run --rm -p 8084:80 --name angular-prod-app angular-env-prod
```

After running the container, you can access the staging application at `http://localhost:8083/tpor/` and the production application at `http://localhost:8084/tpor/`.
