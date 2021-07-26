#!/bin/bash

deploy()
{
    for ((port = $1; port <= $2; port++))
    do
        echo Start container torproxy at port $port
        docker run -it \
            -p $port:8118 \
            -e TOR_NewCircuitPeriod=600 \
            -e TOR_MaxCircuitDirtiness=600 \
            -d dperson/torproxy
    done
}

deploy $@
