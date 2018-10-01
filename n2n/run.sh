#!/bin/bash


if [ $# -lt 1 ];then
    echo "use: supernode port | edge ip:port | clean"
    exit;
fi

cmd=${1}

if [ ${cmd} = "supernode" ];then
    port=${2}
    ./build/supernode -l ${port}
    # -v -f
    exit
fi

if [ ${cmd} = "edge" ];then
    addr=${2}
    ./build/edge -d n2n0 -a dhcp:0.0.0.0 -c atoml -k atoml -l '${addr}' -f 
    exit
fi

if [ ${cmd} = "clean" ];then
    killall supernode
    killall edge
    exit
fi

echo "parameter error!"
