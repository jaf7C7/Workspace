#!/bin/sh
#
# Download the and install the Bitwarden CLI.

set -e

get_latest () {
	echo "Finding latest version..."

	while IFS= read -r url; do
		case "${url}" in
			(*/bitwarden/cli/releases/download/v[[:digit:]].[[:digit:]][[:digit:]].[[:digit:]]/bw-linux-[[:digit:]].[[:digit:]][[:digit:]].[[:digit:]].zip*)
				url="${url%%.zip*}.zip"
				latest="https://github.com/bitwarden${url##*/bitwarden}"
		esac
	done <<-EOF
	"$(curl -sL 'https://github.com/bitwarden/cli/releases/latest')"
	EOF

	if [ -z "${latest}" ]; then
		printf '%s\n' "$0: url not found" >&2
		return 1
	else
		version="${latest##*-}"
		version="${version%.zip}"
		echo "Found bw version ${version}"
	fi
}

check_version () {
	inst_vers="$(bw --version)"
	__OLDIFS="${IFS}"
	IFS=.
	set -f
	if [ "$(printf '%s' $inst_vers)" -ne "$(printf '%s' $version)" ]; then
		printf 'bw version %s already installed. Replace with %s? (y/N) ' "$(bw --version)" "${version}"
		read -r reply
		case "${reply}" in
			[Yy]|[Yy]es)
				rm ~/.local/bin/bw
			;;

			*)
				return 1
			;;
		esac
	fi
	IFS="${__OLDIFS}"
	set +f
}

install () {
	echo "Installing..."

	trap 'rm /tmp/bw.zip' EXIT
	curl -sLo /tmp/bw.zip "${latest}" && unzip /tmp/bw.zip -d "${HOME}/.local/bin"
	chmod +x ~/.local/bin/bw

	echo "Installed to ~/.local/bin/bw"
}

main ()
{
	get_latest
	[ -x ~/.local/bin/bw ] && check_version || return
	install
}

main "$@"

