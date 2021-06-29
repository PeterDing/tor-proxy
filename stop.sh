#!/bin/bash

stop()
{
    ps_ids=$(docker ps | grep torproxy | cut -f 1 -d ' ')

    echo 'Stop torproxy container:'
    docker stop $ps_ids
}

stop
