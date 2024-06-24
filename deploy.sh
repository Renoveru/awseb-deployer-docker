#!/bin/bash
source .env

REPO_NAME=$REPO_NAME
PAT=$PAT
USERNAME=$USERNAME

docker build . -t $REPO_NAME:latest --platform linux/x86_64

docker tag $REPO_NAME:latest ghcr.io/renoveru/$REPO_NAME:latest

export CR_PAT=$PAT

echo $CR_PAT | docker login ghcr.io -u $USERNAME --password-stdin

docker push ghcr.io/renoveru/$REPO_NAME:latest