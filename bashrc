# added by Anaconda3 4.1.1 installer
export PATH="/home/chris/anaconda2/bin:$PATH"

# Add my sweet ssmove script
export PATH="$PATH:/home/bin"

# alias the start for it
alias ssmove="ssmove.py"

# wwas this the colorful thing?
export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\h:\[$(tput sgr0)\]\[\033[38;5;6m\][\w]:\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

#export PS1=" \[\e[00;34m\]金 :  \[\e[0m\]"





# Only show the current directory
PROMPT_DIRTRIM=1

# 1 liner for backing up org files.
alias org='git add -A;git commit -m "updates";git push'

#start a pymodoro with a description
alias pyms='python3 ~/Documents/pymodoro/pymodoro.py start --description'

# Used to kill chrome notifications (and all other chromes opened)
alias kn='killall -r [c]hrome'

# Set brightness to 100
alias 100='xbacklight -set 100'

# discards stderr messages from gvim.
alias gvim="gvim 2>/dev/null"

alias jup='konsole --new-tab -e jupyter notebook'

# Move the mouse out of the way
alias mm='xdotool mousemove 0 0'

alias ls='ls -h --color'
alias tree='tree -C'

# make it simple to open files
alias open="xdg-open"

# added by Anaconda3 4.2.0 installer
export PATH="/home/chris/anaconda3/bin:$PATH"

# shortcut to open emacsclient
alias emacs='emacs --insecure &'

# Remove spaces from filenames in directory
alias rmspaces='for f in *\ *; do mv "$f" "${f// /_}"; done'

# ssh tunnels
alias statsTunnel='ssh -N -f -L localhost:8888:localhost:8888 root@stats'

# nix path
if [ -f $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
    source $HOME/.nix-profile/etc/profile.d/nix.sh
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
