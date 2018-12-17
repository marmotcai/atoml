#!/bin/bash


docker run --rm=true \
         -v ~/input:/input -v ~/output:/output \
        atoml/ffmpeg \
        -stats -y \
        -i /input/sample.mp4 \
        -c:v libx265 -pix_fmt yuv420p10 \
        -t 5 -f mp4 /output/test.mp4
