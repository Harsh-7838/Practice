# Use an official Node.js runtime as a parent image
FROM node:20-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY Task_3/package*.json ./

# Install application dependencies
RUN npm install

# Bundle app source
COPY Task_3/* .

# Expose port 3000
EXPOSE 5000

# Define the command to run your application
CMD ["npm", "start"]
