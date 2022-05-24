#!/bin/sh
#
# Install latest version of Dash with line-editing support.
#
# To set dash as default user shell:
# Add "${HOME}/.local/bin/dash" to /etc/shells and run:
# chsh -s "${HOME}/.local/bin/dash" "${USER}"

set -eu

# Install the required dependencies
sudo apt-get update && \
sudo apt-get install -y \
	libedit-dev \
	automake

# Clone the Dash source into "${HOME}/Source/Dash" 
mkdir -p "${HOME}/Source" && \
git clone https://git.kernel.org/pub/scm/utils/dash/dash.git "${HOME}/Source/Dash"

# Configure and install into ~/.local/bin
mkdir -p "${HOME}/.local" && \
cd "${HOME}/Source/Dash" && \
./autogen.sh && \
./configure --with-libedit --prefix="${HOME}/.local" && \
make && \
sudo make install
