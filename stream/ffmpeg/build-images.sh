#!bin/bash

docker_ver='2.0'

docker build . -f ./docker-images/3.4/ubuntu/Dockerfile -t atoml/ffmpeg

docker login --username=18607171301 registry.cn-shanghai.aliyuncs.com
docker tag atoml/ffmpeg registry.cn-shanghai.aliyuncs.com/atoml/ffmpeg:${docker_ver}
docker push registry.cn-shanghai.aliyuncs.com/atoml/ffmpeg:${docker_ver}