# Stage 1: Build the Angular application
FROM node:18 as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve the application from a lightweight server
FROM nginx:alpine

# Copy the build output to replace the default nginx contents.
COPY --from=build /app/dist/angular-env-example/browser /usr/share/nginx/html

# Copy the environment template and the entrypoint script
COPY --from=build /app/src/assets/env.template.js /usr/share/nginx/html/assets/env.template.js
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
