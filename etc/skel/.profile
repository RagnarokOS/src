# ~/.profile: executed by the command interpreter for login shells.

# Aliases for mandoc. For details as to why this is here, see commit message:
# https://github.com/RagnarokOS/src/commit/5021ef69ea27d21883329b515b226c9d0defae68
manread() {
	/usr/bin/mman "$1" | less;
}

alias man='manread'
alias mdoc='/usr/bin/mandoc_mdoc'
alias roff='/usr/bin/mandoc_roff'
alias eqn='/usr/bin/mandoc_eqn'
alias tbl='/usr/bin/mandoc_tbl'
alias apropos='/usr/bin/mapropos'
alias soelim='/usr/bin/msoelim'
alias whatis='/usr/bin/mwhatis'
alias catman='/usr/bin/mcatman'

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export ENV="$HOME/.kshrc"
export PATH HOME TERM
