#!/bin/sh
#
# Install Node Version Manager
#
# This script will not touch ~/.profile or ~/.shrc. This must be done manually.
# Add the following to ~/.profile:
#	export NVM_DIR="${HOME}/.nvm"
#	export NVM_BIN="${HOME}/.local/nvm_bin"
# And add this to ~/.shrc
#	test -s "${NVM_DIR}/nvm.sh" && \. "${NVM_DIR}/nvm.sh"
# This will ensure nvm is sourced at runtime.
#
# Once nvm is installed run 'nvm install node' to install the latest version of
# node and npm.

# Clone the nvm git repository into ~/.nvm, checkout the latest version and 
# source the nvm script. You may need to quit and restart your shell afterwards.
export NVM_DIR="${HOME}/.nvm" export NVM_BIN="${HOME}/.local/nvm_bin" && (
	git clone https://github.com/nvm-sh/nvm.git "${NVM_DIR}"
	cd "${NVM_DIR}"
	git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && . "${NVM_DIR}/nvm.sh" && mkdir -p "${HOME}/.local/nvm_bin"

