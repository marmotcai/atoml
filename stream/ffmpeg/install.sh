#!/bin/bash

# docker login --username=WuhanDev@changguan --password=QVdKKu33 registry.cn-shanghai.aliyuncs.com

docker pull registry.cn-shanghai.aliyuncs.com/cvideo/ffmpeg:4.0
docker tag registry.cn-shanghai.aliyuncs.com/cvideo/ffmpeg:4.0 atoml/ffmpeg
docker rmi registry.cn-shanghai.aliyuncs.com/cvideo/ffmpeg:4.0
