#!/bin/bash

start()
{
    ps_ids=$(docker ps | grep torproxy | cut -f 1 -d ' ')

    echo 'Start torproxy container:'
    docker start $ps_ids
}

start
