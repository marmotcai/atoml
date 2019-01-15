#!/bin/bash

cmd=${1}
case $cmd in 
    clean)

    ;;

    build) 
        echo 'build images ...'
        make DOCKERNAME=${2} DOCKERTAG=${3} DOCKERIMAGENAME=${4}
    ;;

    test)
        echo 'test images ...'
        docker run --rm -ti ${2} bash
    ;;

    *) 
        echo "use: build name tag imagename(Co.,/image)"
        echo "use: test imagename"
        echo "use: clean"
        exit 1;
    ;;
esac

exit 0;