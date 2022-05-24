#!/bin/sh
#
# Install the latest version of docker

main()
{
    # Remove old versions of docker
    sudo apt-get remove docker docker-engine docker.io containerd runc;

    # Update the package index
    sudo apt-get update;

    # Install the dependencies
    sudo apt-get install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release;

    # Add Docker's GPG key
    curl -fsSL https://download.docker.com/linux/debian/gpg \
        | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg;

    # The following command adds the *stable* release repository
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
        | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null;

    # Install the Docker engine
    sudo apt-get update;
    sudo apt-get install docker-ce docker-ce-cli containerd.io;
    
    # Verify the installation
    # If you get an error:
    #   'Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?'
    # Try:
    # '$ sudo systemctl umask docker'
    # '$ sudo systemctl restart docker'
    sudo docker run hello-world;
}

main "$@";

