#!/bin/bash

/usr/bin/supernode -v

/usr/bin/edge -d n2n0 -a 10.0.0.1 -c atoml -k atoml -l 127.0.0.1:7654

service isc-dhcp-server restart

tail -f /dev/null
