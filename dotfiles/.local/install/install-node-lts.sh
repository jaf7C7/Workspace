#!/bin/sh
#
# Install latest LTS version of node and npm

set -e;

main()
{
	INSTALL_PATH=~/.local/bin/node;

	if test -e "${INSTALL_PATH}"; then
		echo "${INSTALL_PATH} already exists!" >&2;
		exit 2;
	fi

	LATEST_LTS_VERSION="$(
		curl -s https://nodejs.org/en/download/ \
			| sed -n '/Latest LTS Version:/s/^.*<strong>\([[:digit:]]\{2\}\.[[:digit:]]\{2\}\.[[:digit:]]\)<\/strong>.*$/\1/p';
	)";
	
	if test -n "${LATEST_LTS_VERSION}"; then
		echo "Version found: ${LATEST_LTS_VERSION}" >&2;
	else
		echo "Couldn't find latest version" >&2;
		exit 1;
	fi

	SOURCE_URL="https://nodejs.org/dist/v${LATEST_LTS_VERSION}/node-v${LATEST_LTS_VERSION}-linux-x64.tar.xz";
	TEMP_FILE="/tmp/node-v${LATEST_LTS_VERSION}-linux-x64.tar.xz";

	echo "Install path: ${INSTALL_PATH}" >&2;
	echo "Retrieving tarball from ${SOURCE_URL}" >&2;
	
	curl -o "${TEMP_FILE}" "${SOURCE_URL}" \
		&& tar -xf "${TEMP_FILE}" -O > "${INSTALL_PATH}" \
		&& echo "Installed successfully at ${INSTALL_PATH}" >&2 \
		&& chmod +x "${INSTALL_PATH}";
}

main "$@";

