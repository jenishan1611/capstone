#!/bin/bash

docker build -t reactimg .
docker-compose down || true
docker-compose up -d

