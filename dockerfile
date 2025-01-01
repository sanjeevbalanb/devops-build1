# Use the official Node.js image as the base image
FROM node:16 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json for npm install
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire source code to the container
COPY . .

# Build the React app for production
RUN npm run build

# Use nginx as a lightweight web server to serve the app
FROM nginx

# Copy the build output from the previous step to the nginx folder
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 for nginx to serve the app
EXPOSE 80

# Run nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

