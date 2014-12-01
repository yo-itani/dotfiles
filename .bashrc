# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
stty stop undef
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=/home/ansible/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh
fi
