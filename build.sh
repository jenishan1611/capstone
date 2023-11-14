#!/bin/bash

docker stop reactcont
docker rm reactcont
docker rmi reactimg
docker build -t reactimg .

