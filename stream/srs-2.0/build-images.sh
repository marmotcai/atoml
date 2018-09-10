#!bin/bash

docker_ver='2.0'

docker build . -f ./Dockerfile -t atoml/srs

docker login --username=18607171301 registry.cn-shanghai.aliyuncs.com
docker tag atoml/srs registry.cn-shanghai.aliyuncs.com/atoml/srs:${docker_ver}
docker push registry.cn-shanghai.aliyuncs.com/atoml/srs:${docker_ver}