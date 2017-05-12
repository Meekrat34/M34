#!/bin/bash
#
# My bash profile
# Personal environment variables and startup programs go in here

# if running bash then source bashrc
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists ( home to my scripts )
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# Load alias profile 
if [ -f "$HOME/.bash_aliases" ]; then
	. "$HOME/.bash_aliases"
fi
# Load profile
if [ -f "$HOME/.profile" ]; then
	. "$HOME/.profile"
fi
