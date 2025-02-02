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
    CURRENT_COMMAND=$BASH_COMMAND

    curl \
        --silent \
        --request POST \
        --data-urlencode history_entry="$CURRENT_COMMAND" \
        https://httpbin.org/post |
    jq .
}

trap record_command DEBUG
