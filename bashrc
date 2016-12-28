<<<<<<< HEAD
=======
# added by Anaconda3 4.1.1 installer
export PATH="/home/chris/anaconda3/bin:$PATH"
>>>>>>> 4fcb9b4a0c01f14f3dedfc5f922829eb33f6fec4

# wwas this the colorful thing?
export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\h:\[$(tput sgr0)\]\[\033[38;5;6m\][\w]:\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

# Only show the current directory
PROMPT_DIRTRIM=1

<<<<<<< HEAD

# pymodoro

#start a pymodoro with a description
alias pyms='python3 ~/Documents/pymodoro/pymodoro.py start --description'

# Used to kill chrome notifications (and all other chromes opened)
alias kn='killall -r [c]hrome'
=======
# discards stderr messages from gvim.
alias gvim="gvim 2>/dev/null"
>>>>>>> 4fcb9b4a0c01f14f3dedfc5f922829eb33f6fec4

alias jup='konsole --new-tab -e jupyter notebook'

# Move the mouse out of the way
alias mm='xdotool mousemove 0 0'

alias ls='ls -h --color'
alias tree='tree -C'
alias cdm='cd ~/Documents/assignment-upstream-fall-2016'
alias shutdown='sudo shutdown -P now'

alias sim='python3 SimulationClasses.py'

# added by Anaconda3 4.2.0 installer
export PATH="/home/chris/anaconda3/bin:$PATH"
