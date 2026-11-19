# Stage 1: Build the Angular application
FROM registry.access.redhat.com/ubi9/nodejs-20:latest AS build

USER root
WORKDIR /app

COPY package.json ./
RUN npm install

COPY . .
RUN npm run build

# Stage 2: Serve static assets with unprivileged nginx on 8080
FROM nginxinc/nginx-unprivileged:1.27-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist/angular-app/browser /usr/share/nginx/html

EXPOSE 8080
