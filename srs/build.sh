#!bin/bash


# idocker pull ossrs/srs

docker run -p 1935:1935 -p 1985:1985 -p 8080:8080 ossrs/srs objs/srs -c conf/docker.conf
           
