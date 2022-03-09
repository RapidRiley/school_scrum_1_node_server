# Author: Riley Warps
# Created: 2022/02/19

FROM node:alpine

# Set up environment
ARG SERVER_PORT
ENV PORT=$SERVER_PORT
EXPOSE $SERVER_PORT

# Add NPM to image
RUN apk add --update npm

# Copy files and install Node packages.
RUN mkdir /node
COPY package*.json /node/
WORKDIR /node
RUN npm i
COPY src ./src

# Start generator & server
CMD npm start