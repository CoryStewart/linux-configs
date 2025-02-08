# ~/.bashrc: executed by bash(1) for non-login shells.

# Determine Linux/Mac OS & VER:
if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
    # linuxbase.org
    OS=$(lsb_release -si)
    VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
    # Older Debian/Ubuntu/etc.
    OS=Debian
    VER=$(cat /etc/debian_version)
elif [ -f /etc/SuSe-release ]; then
    # Older SuSE/etc.
    # ...
elif [ -f /etc/redhat-release ]; then
    # Older Red Hat, CentOS, etc.
    # ...
elif [ "$(uname -s)" == Darwin ]; then
    # Mac OSX
    OS=Darwin
    VER="(uname -r)"
else
    # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
    OS=$(uname -s)
    VER=$(uname -r)
fi

echo "OSTYPE=$OSTYPE, OS=$OS, VER=VER"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "OSTYPE: linux-gnu"

    # Note: PS1 and umask are already set in /etc/profile. You should not
    # need this unless you want different defaults for root.
    # PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
    # umask 022

    PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    export LS_OPTIONS='--color=auto'
    alias ls='ls $LS_OPTIONS'
    alias ll='ls -la'

    export PATH=$PATH:/usr/local/go/bin:/root/go/bin
elif [[ "$OSTYPE" == "darwin"* ]]; then
    #echo "OSTYPE: darwin (Mac OSX)"
elif [[ "$OSTYPE" == "cygwin" ]]; then
    #echo "OSTYPE: cygwin"
elif [[ "$OSTYPE" == "msys" ]]; then
    #echo "OSTYPE: msys (windows MinGW)"
elif [[ "$OSTYPE" == "win32" ]]; then
    # I'm not sure this can happen.
    #echo "OSTYPE: win32"
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    #echo "OSTYPE: freebsd"
else
    #echo "OSTYPE: unknown"
fi


# --v--v--v--v--v--v--v--v--v--v--v--v--
# Common:
 
# Use vi as the cmdline editor:
set -o vi

if [ -f ~/.aliases.bash ]; then
    source ~/.aliases.bash
fi
# --^--^--^--^--^--^--^--^--^--^--^--^--
