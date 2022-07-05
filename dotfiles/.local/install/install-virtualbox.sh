#!/bin/sh
#
# Install Oracle VirtualBox
#
# Source: https://www.virtualbox.org/wiki/Linux_Downloads
# Documentation: https://www.oracle.com/technical-resources/articles/it-infrastructure/admin-manage-vbox-cli.html

# Quit if not amd64 arch.
arch=$(dpkg --print-architecture)
case $arch in
	*amd64) : ;;
	*) echo "unsupported architecture $arch" >&2 ; exit 1 ;;
esac

# Update the package index
sudo apt-get update

# Install the dependencies
sudo apt-get install ca-certificates curl gnupg lsb-release linux-headers-amd64

# Add the gpg key to the gpg keyring
curl -fsSL https://www.virtualbox.org/download/oracle_vbox_2016.asc \
	| sudo gpg --dearmor -o /usr/share/keyrings/oracle-virtualbox-2016.gpg

# Add the source to /etc/apt/sources.list.d/virtualbox.list
echo "deb [arch=$arch signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" \
	| sudo tee /etc/apt/sources.list.d/virtualbox.list >/dev/null

# The key fingerprint for oracle_vbox_2016.asc is
# 
# B9F8 D658 297A F3EF C18D  5CDF A2F6 83C5 2980 AECF
# Oracle Corporation (VirtualBox archive signing key) <info@virtualbox.org>
# 
# To install VirtualBox, do
# 
# 	$ sudo apt-get update
# 	$ sudo apt-get install virtualbox-6.1

sudo apt-get update
sudo apt-get install virtualbox-6.1
