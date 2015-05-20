#!/bin/bash

# I don't really like this, but seems to be the only way right now?
cp ~/.ssh/id_rsa ./id_rsa

docker build -t docker-dev .

rm ./id_rsa
