# ~/.bashrc: executed by bash(1) for non-login shells.
# See also '/etc/bash.bashrc' for global aliases and configuration
#

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS.
shopt -s checkwinsize

# Fancy colour prompt. See:
# http://unix.stackexchange.com/questions/266256/compact-bash-prompt-when-using$
# and also:
# https://github.com/jimeh/git-aware-prompt/blob/master/prompt.sh
PRE_PS1='${debian_chroot:+($debian_chroot)}\[\e[1;32m\]\u@\h\[\e[m\]:\[\e[1;34m\]'
POST_PS1='\[\e[m\]\$ '

MAXLEN=20
PREFIX_LEN=8
get_PS1() {
	local branch
	if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    	if [[ "$branch" == "HEAD" ]]; then
			branch='detached*'
		fi
		git_branch="($branch)"

		local status=$(git status --porcelain 2> /dev/null)
    	if [[ "$status" != "" ]]; then
        	git="\[\e[0;31m\]$git_branch\[\e[m\]"
    	else
        	git="\[\e[0;32m\]$git_branch\[\e[m\]"
    	fi
  	else
    	git="" # no repo here
  	fi

	# limit directory length
	limit=${1:-$MAXLEN}
	if [[ "${#PWD}" -gt "$limit" ]]; then
		## Take the first $PREFIX_LEN characters of the path
		left="${PWD:0:$PREFIX_LEN}"
        ## Append the current directory with no path
        PS1="$PRE_PS1${left}.../\W$git$POST_PS1"
    else
    	PS1="$PRE_PS1\w$git$POST_PS1"
	fi
}
PROMPT_COMMAND=get_PS1

#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$'

# enable color support for some commands
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Control history management
export HISTCONTROL=ignoreboth:erasedups

# Set vim mode
set -o vi

# Useful command to mount my NAS using SSHFS
NAS_HOSTNAME="nas.scaramuzza.me"
NAS_MOUNTPOINT="/media/pol/$NAS_HOSTNAME"

nas-mount()
{
	sudo mkdir -p $NAS_MOUNTPOINT
	sudo chmod a+rwx $NAS_MOUNTPOINT
	sshfs -C -o uid=1000,gid=1000,reconnect \
		pol@$NAS_HOSTNAME:/mnt/data $NAS_MOUNTPOINT
}

nas-umount()
{
	sudo umount $NAS_MOUNTPOINT
}

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Alias and additional commands definitions.
alias fuck='sudo $(history -p \!\!)'
alias sudo='sudo ' # see http://unix.stackexchange.com/questions/235366/load-aliases-from-bashrc-file-while-using-sudo#235369
alias stopwatch='echo Press enter to stop; time read'
alias config='/usr/bin/git --git-dir="$HOME"/.dotfiles/ --work-tree="$HOME"'
