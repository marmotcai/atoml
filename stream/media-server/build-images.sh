#!/bin/bash

ffmpeg_docker_name="registry.cn-shanghai.aliyuncs.com/atoml/ffmpeg:1.0"
srs_docker_name="registry.cn-shanghai.aliyuncs.com/atoml/srs:1.0"

docker pull $ffmpeg_docker_name
docker tag $ffmpeg_docker_name atoml/ffmpeg
docker rmi --force $ffmpeg_docker_name

docker pull $srs_docker_name
docker tag $srs_docker_name atoml/srs
docker rmi --force $srs_docker_name
