#!/bin/sh
#
# Bring back my girls

set -e

main ()
{
	sudo apt-get update && \
	sudo apt-get upgrade -y && \
	sudo apt-get install -y \
		bc \
		bsdmainutils \
		curl \
		ed \
		entr \
		git \
		jq \
		less \
		lynx \
		nodejs \
		nvi \
		pandoc \
		par \
		screen \
		shellcheck \
		stow \
		tmux \
		tree \
		universal-ctags \
		vim.tiny \
		xsel \
		;
}

main "$@"

