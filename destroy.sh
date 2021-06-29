#!/bin/bash

destroy()
{
    ps_ids=$(docker ps | grep torproxy | cut -f 1 -d ' ')

    echo 'Stop torproxy container:'
    docker stop $ps_ids

    echo 'Remove torproxy container:'
    docker rm $ps_ids
}

destroy
