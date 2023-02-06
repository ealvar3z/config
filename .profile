# $OpenBSD: dot.profile,v 1.8 2022/08/10 07:40:37 tb Exp $
#
# sh/ksh initialization


# fix dircolors for Selenized
LS_COLORS="$LS_COLORS:ow=1;7;34:st=30;44:su=30;41"
ENV=$HOME/.kshrc
PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin

export ENV LS_COLORS PATH HOME TERM
