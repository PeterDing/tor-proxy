#!/bin/bash

# https://docs.docker.com/engine/install/ubuntu/
install_docker()
{
    if [ -f /usr/bin/dockerd ]; then
        echo '# Docker had install.'
    else
        echo '# Remove old Docker'
        sudo apt-get remove docker docker-engine docker.io containerd runc -y

        echo '# apt update'
        sudo apt-get update

        echo '# Install Dependents'
        sudo apt-get install \
            apt-transport-https \
            ca-certificates \
            curl \
            gnupg \
            lsb-release -y

        echo 'Add Docker’s official GPG key:'
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

        echo 'Set up the stable repository'
        echo \
          "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
          $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

        echo 'Install Docker'
        sudo apt-get install docker-ce docker-ce-cli containerd.io -y

        echo 'Run hello-world'
        sudo docker run hello-world
    fi
}

# https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user
add_user_to_docker_group()
{
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker
}

pull_torproxy()
{
    sudo docker pull dperson/torproxy
}

install_docker
add_user_to_docker_group
pull_torproxy
