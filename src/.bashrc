# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
 
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Jaanvi's Code
cd # start at $HOME

function record_command {
    CURRENT_COMMAND=$(echo "$BASH_COMMAND" | sed 's/\x1b\[[0-9;]*m//g')  # Removes ANSI escape sequences 
    echo "$CURRENT_COMMAND"
}

trap record_command DEBUG
