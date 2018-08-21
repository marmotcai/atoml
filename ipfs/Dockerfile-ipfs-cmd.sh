#!bin/bash

docker build . -f ./Dockerfile-ipfs-cmd -t atoml/ipfs-cmd

docker run --rm -p 5001:5001 -p 8080:8080 atoml/ipfs-cmd

# docker rm -f my-ipfs-cmd
# docker run --name my-ipfs-cmd -p 5001:5001 -p 8080:8080 -d atoml/ipfs-cmd