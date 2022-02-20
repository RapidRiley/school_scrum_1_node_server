# Author: Riley Warps
# Created: 2022/02/19

FROM node:alpine

# Set up environment
ARG SERVER_PORT
ENV PORT=$SERVER_PORT
EXPOSE $SERVER_PORT

# Add NPM to image
RUN apk add --update npm python3 git

# Clone and set up data generator
WORKDIR /git
RUN git clone https://github.com/RapidRiley/data_generator
RUN mkdir -p /app/data
RUN mv ./data_generator/generate.py /app/
RUN rm -r /git

# Copy and install files
COPY package*.json /app/
WORKDIR /app
RUN npm i

COPY src /app/src

# Start generator & server
CMD python3 /app/generate.py & npm start