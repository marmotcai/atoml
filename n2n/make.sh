#!/bin/bash

imagename='andrew/n2n-v2-x86_64'

if [ $# -lt 1 ];then
    echo "use: build | supernode | edge | clean"
    exit;
fi

cmd=${1}

if [ ${cmd} = "clean" ];then
    docker rm -f my-n2n
    docker rm -f my-n2n-edge
    docker rm -f my-n2n-sn

    docker images | grep none | awk  '{print $3 }' | xargs docker rmi -f
    docker rmi -f ${imagename}
     
    exit;
fi

if [ ${cmd} = "build" ];then
    echo 'build images ...'
    make TARGET_ARCHITECTURE=x86_64

    if [ $# -lt 2 ];then
        exit;
    fi    
    
    port=${2}

    if [ $# -eq 3 ] && [ ${3} -eq "test" ];then
      docker_cmd='docker run --rm=true --privileged -p '${port}':7654/udp -p 67:67/udp --name=my-n2n '${imagename}':latest'
    else
      docker_cmd='docker run -d  --privileged -p '${port}':7654/udp -p 67:67/udp --name=my-n2n '${imagename}':latest'
    fi

    echo ${docker_cmd}

    docker rm -f my-n2n
    ${docker_cmd}

    exit;
fi

if [ ${cmd} = "supernode" ] || [ ${cmd} = "all" ];then
    if [ $# -ne 2 ];then
        echo "use: supernode port"
        exit;
    fi

    port=${2}
    entrypoint='/usr/bin/supernode'
    supernode_cmd='-l '${port}' -v -f'
    docker_cmd='docker run -d  --privileged -p '${port}':'${port}'/udp --entrypoint='${entrypoint}' --name=my-n2n-sn '${imagename}':latest '${supernode_cmd}
    echo ${docker_cmd}
 
    docker rm -f my-n2n-sn
    ${docker_cmd}

    exit;
fi

if [ ${cmd} = "edge" ];then
    
    addr=""
    entrypoint='/usr/bin/edge'
    if [ $# -ne 3 ];then
      docker_ip=$(docker inspect --format='{{.NetworkSettings.IPAddress}}' my-n2n-sn)
      ip=${docker_ip}
      port=3983
    else
      ip=${2}
      port=${3}
    fi

    addr=${ip}':'${port}

    edge_cmd='-d n2n0 -a -r dhcp:0.0.0.0 -c atoml -k atoml -l '${addr}' -f'    
    docker_cmd='docker run -d --privileged --entrypoint='${entrypoint}' --name my-n2n-edge '${imagename}':latest '${edge_cmd}
    echo ${docker_cmd}

    docker rm -f my-n2n-edge
    ${docker_cmd}

    exit;
fi

echo "parameter error!"
