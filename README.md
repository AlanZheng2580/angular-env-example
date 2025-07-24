# This project demonstrates how to pass environment variables at runtime to a Dockerized Angular application. This allows you to change the application's behavior without rebuilding the Docker        │image.
## How to Build the Docker Image
1.  Navigate to the `angular-env-example` directory.
2.  Run the following command to build the Docker image:
```bash 
DOCKER_BUILDKIT=0 docker build -t angular-env-example .
```
## How to Run the Application
 1.  Run the Docker container using the following command. This will start the application on port 8081.
```bash
docker run -d -p 8000:80 -e GREETING="Hello from Docker!" --name angular-env-app angular-env-example
```
```bash
docker run -d -p 8000:80 -e GREETING="你好，世界！" --name angular-env-app angular-env-example
```
3. Refresh your browser at `http://localhost:8000`, and you will see the new message