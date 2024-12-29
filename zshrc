# brew install python
alias python=/usr/local/bin/python3.10
alias pip=/usr/local/bin/pip3.10

export PATH=${PATH}:`go env GOPATH`/bin

PS1="%1~: "
