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

echo "${source_path} ${source_filename}  --->> ${docker_path} ${output_filename}"

docker run -v ${source_path}:${docker_path} --rm=true atoml/ffmpeg \
        -stats \
        -y -i ${docker_path}/${source_filename} \
        -t 5 -f mp4 ${docker_path}/${output_filename}

#checkout file
#DECODEFILE=${VIDEOPATH}/${OUTPATH}
#NEWDIR=${DECODEFILE%/*}
#if [ ! -d ${NEWDIR} ]; then
#  mkdir -p ${NEWDIR}
#fi
#echo $DECODEFILE

#if [ ! -f "$DECODEFILE" ]; then
#    rm -rf $DECODEFILE
#fi

#docker run -v $PWD:/tmp --rm=true atoml/ffmpeg \
#        -stats \
#        -i /tmp/${INPUTPATH} \
#        -t 5 -f mp4 ${OUTPATH}

# docker rm -f tmp-ffmpeg
# curl -connect-timeout 2 -m 5 "http://xxxx/$OUTPATH"

# docker run -it --entrypoint='bash' atoml/ffmpeg
