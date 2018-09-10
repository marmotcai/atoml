#!bin/bash

if [ $# -ne 3 ];then
    echo "The argument must be 3: sourcepath sourcefilename outputfilename"
    exit;
else
  echo "begin..."
fi

source_path=${1}
source_filename=${2}
output_filename=${3}

docker_path='/tmp/workdir'

docker_cmd='docker run -v '${source_path}':'${docker_path}' --rm=true atoml/ffmpeg'
#ffmpeg_cmd=' -re -i '${docker_path}'/'${source_filename}' -vcodec copy -acodec copy -f flv -y '${output_filename}
ffmpeg_cmd=' -re -i '${docker_path}'/'${source_filename}' -y -f flv '${output_filename}

echo "${docker_cmd} \
       ${ffmpeg_cmd}"

for a in `seq 5` 
do   
  ${docker_cmd} \
  ${ffmpeg_cmd}

  sleep 1
done  


# docker run -it --entrypoint='bash' atoml/ffmpeg