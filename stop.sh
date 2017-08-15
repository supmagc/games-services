#!/bin/bash

docker stop $(docker ps -q --filter "ancestor=services" --filter "status=running")
