#	$OpenBSD: ksh.kshrc,v 1.32 2018/05/16 14:01:41 mpf Exp $

case "$-" in
*i*)	# we are interactive
	# we may have su'ed so reset these
	USER=$(id -un)
	UID=$(id -u)
	case $UID in
	0) PS1S='# ';;
	esac
	PS1S=${PS1S:-'$ '}
	HOSTNAME=${HOSTNAME:-$(uname -n)}
	HOST=${HOSTNAME%%.*}

	PROMPT="$USER:!$PS1S"
	#PROMPT="<$USER@$HOST:!>$PS1S"
	PPROMPT='$PWD:'"$PS1S"
	#PPROMPT='<$USER@$HOST:$PWD:!>'"$PS1S"
	PS1=$PPROMPT
	# $TTY is the tty we logged in on,
	# $tty is that which we are in now (might by pty)
	tty=$(tty)
	tty=${tty##*/}
	TTY=${TTY:-$tty}
	# $console is the system console device
	console=$(sysctl kern.consdev)
	console=${console#*=}

	set -o emacs

	alias la='ls -a'
	alias h='fc -l | more'

	case "$TERM" in
	sun*-s)
		# sun console with status line
		if [[ $tty != $console ]]; then
			# ilabel
			ILS='\033]L'; ILE='\033\\'
			# window title bar
			WLS='\033]l'; WLE='\033\\'
		fi
		;;
	xterm*)
		ILS='\033]1;'; ILE='\007'
		WLS='\033]2;'; WLE='\007'
		;;
	*)	;;
	esac
	# do we want window decorations?
	if [[ -n $ILS ]]; then
		function ilabel { print -n "${ILS}$*${ILE}">/dev/tty; }
		function label { print -n "${WLS}$*${WLE}">/dev/tty; }

		alias stripe='label "$USER@$HOST ($tty) - $PWD"'
		alias istripe='ilabel "$USER@$HOST ($tty)"'

		# Run stuff through this to preserve the exit code
		function _ignore { local rc=$?; "$@"; return $rc; }

		function wftp { ilabel "ftp $*"; "ftp" "$@"; _ignore eval istripe; }

		function wcd     { \cd "$@";     _ignore eval stripe; }

		function wssh    { \ssh "$@";    _ignore eval 'istripe; stripe'; }
		function wsu     { \su "$@";     _ignore eval 'istripe; stripe'; }

		alias su=wsu
		alias cd=wcd
		alias ssh=wssh
		eval stripe
		eval istripe
		PS1=$PROMPT
	fi
	alias c=clear
	alias x=exit
	alias p='ps -l'
	alias df='df -k'
	alias du='du -k'
	alias rsize='eval $(resize)'
	alias ?='w3m $@'
	alias pa='doas pkg_add $@'
;;
*)	# non-interactive
;;
esac
