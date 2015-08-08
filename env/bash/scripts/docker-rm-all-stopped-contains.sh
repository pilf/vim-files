#!/bin/sh
docker rm $(docker ps -aq --filter="status=exited")
