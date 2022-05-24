#!/bin/sh
#
# Generate a new ssh key for use with github etc.

set -eu

main ()
{
	if command -v ssh > /dev/null
	then
		ssh-keygen -t ed25519 -C jossappletonfox@protonmail.com
		eval "$(ssh-agent -s)"
		ssh-add /home/joss/.ssh/id_ed25519.2
	else
		echo "ssh not installed" >&2
	fi
}

main "$@"

