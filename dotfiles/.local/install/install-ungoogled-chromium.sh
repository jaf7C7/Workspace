#!/bin/sh
#
# Install ungoogled-chromium
#
# Taken from 'https://github.com/ungoogled-software/ungoogled-chromium-debian'

main ()
{
    echo 'deb http://download.opensuse.org/repositories/home:/ungoogled_chromium/Debian_Bullseye/ /' \
        | sudo tee /etc/apt/sources.list.d/home-ungoogled_chromium.list > /dev/null

    curl -s 'https://download.opensuse.org/repositories/home:/ungoogled_chromium/Debian_Bullseye/Release.key' \
        | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home-ungoogled_chromium.gpg > /dev/null

    sudo apt update
    sudo apt install -y ungoogled-chromium
}

main "$@"

