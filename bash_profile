export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export GO111MODULE="on go get -u golang.org/x/tools/gopls@latest"
export GOPATH="/usr/local/go/bin/go"
export GOROOT="/usr/local/go/bin"
export PATH="$HOME/.cargo/bin:$PATH" # Add Rust binaries to PATH

eval "$(pyenv init -)"
. "$HOME/.cargo/env"
