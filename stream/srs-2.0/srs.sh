#!bin/bash

if [ $# -ne 2 ];then
    echo "The argument must be 2: sourcepath srs_configfile"
    exit;
else
  echo "begin..."
fi

source_path=${1}
srs_configfile=${2}

docker_path='/srs/workdir'

docker_cmd='docker run -v '${source_path}':'${docker_path}' --rm=true atoml/srs'
srs_cmd='-c '${docker_path}'/'${srs_configfile}

echo "${docker_cmd} \
       ${srs_cmd}"

${docker_cmd} \
${srs_cmd}

#docker run -it --entrypoint='bash' atoml/srs

