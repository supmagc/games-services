#!/bin/bash

docker run -d -p 80:80 \
    -v "$PWD/Code":/var/www \
    -v "$PWD/Logs":/var/log \
    services
