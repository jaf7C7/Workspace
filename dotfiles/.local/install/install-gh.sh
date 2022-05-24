#!/bin/sh
#
# Install the Github CLI.

set -e

main ()
{
	curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
		| sudo gpg  --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg

	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
		| sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

	sudo apt update
	sudo apt install gh

	gh config set editor vi
	gh config set pager more
	gh config set browser firefox
}

main "$@"

