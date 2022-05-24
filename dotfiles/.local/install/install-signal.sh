#!/bin/sh
#
# Install signal messenger

main ()
{
	# Install public key
	curl -sL https://updates.signal.org/desktop/apt/keys.asc \
		| gpg --dearmor > signal-desktop-keyring.gpg
	cat signal-desktop-keyring.gpg \
		| sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

	# Add repository to sources
	echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' \
		| sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

	# Update package database and install
	sudo apt update && sudo apt install signal-desktop
}

main "$@"

