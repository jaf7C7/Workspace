#!/bin/sh
#
# Install tor

# TODO: Doesn't work if your ISP blocks the tor project domain

main ()
{
	sudo apt install apt-transport-https

	printf '%s\n' 'deb [arch=amd64 signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org bullseye main' \
	              'deb-src [arch=amd64 signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org bullseye main' \
		| sudo tee /etc/apt/sources.list.d/tor.list

	curl -s https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc \
		| gpg --dearmor \
		| sudo tee /usr/share/keyrings/tor-archive-keyring.gpg >/dev/null

	sudo apt update
	sudo apt install tor deb.torproject.org-keyring
}

main "$@"

