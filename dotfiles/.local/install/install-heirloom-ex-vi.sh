#!/bin/sh
#
# Install the historical version of vi
#
# It will help to have the following defined in the environment:

sourceurl=https://github.com/n-t-roff/heirloom-ex-vi
destdir=~/.local

main ()
{
	trap "rm -rf ${destdir}/heirloom-ex-vi \
	             ${destdir}/preserve \
	             ${destdir}/bin/vedit \
	             ${destdir}/bin/edit \
	             ${destdir}/bin/view \
	             ${destdir}/bin/wvi \
	             ${destdir}/bin/vi" EXIT
	echo "Source: ${sourceurl}"
	echo "Installing to ${destdir}"
	git -C "${destdir}" clone "${sourceurl}" \
	&& sed -i -e "\;^PREFIX;s;=.*;= ${destdir};" \
	          -e '\;PRESERVEDIR;s;/var;${PREFIX};p' \
	          "${destdir}/heirloom-ex-vi/Makefile.in" \
	&& { cd "${destdir}/heirloom-ex-vi" || return; } \
	&& "${destdir}/heirloom-ex-vi/configure" \
	&& make \
	&& make install \
	&& make mrproper \
	&& mv "${destdir}/bin/ex" "${destdir}/bin/hex" \
	&& cat <<-EOF >>"${destdir}/bin/hvi" \
	&& chmod +x "${destdir}/bin/hvi" \
	&& echo "Install complete!"
#!/bin/sh

TERMCAP="vt102|\${TERM}|dec vt102:"'\\
        :do=^J:co#80:li#24:cl=50E[;HE[2J:\\
        :le=^H:bs:cm=5E[%i%d;%dH:nd=2E[C:up=2E[A:\\
        :ce=3E[K:cd=50E[J:so=2E[7m:se=2E[m:us=2E[4m:ue=2E[m:\\
        :md=2E[1m:mr=2E[7m:mb=2E[5m:me=2E[m:is=E[1;24rE[24;1H:\\
        :rs=E>E[?3lE[?4lE[?5lE[?7hE[?8h:ks=E[?1hE=:ke=E[?1lE>:\\
        :ku=EOA:kd=EOB:kr=EOC:kl=EOD:kb=^H:\\
        :ho=E[H:k1=EOP:k2=EOQ:k3=EOR:k4=EOS:pt:sr=5EM:vt#3:\\
        :sc=E7:rc=E8:cs=E[%i%d;%dr:vs=E[?7l:ve=E[?7h:\\
        :mi:al=E[L:dc=E[P:dl=E[M:ei=E[4l:im=E[4h:'
export TERMCAP

exec ${destdir}/bin/hex -v "\$@"

EOF
}

main "$@"

