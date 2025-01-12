export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="takashiyoshida2"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias dc="docker-compose"
alias dc-e="docker-compose exec"
alias swift-test="swift test --enable-experimental-swift-testing --disable-xctest"

vs() {
    cd /mnt/c/Users/devon/source/repos
}

tmsa() {
    tms && tmux attach-session -t "$1"
}

build() { 
    if ! [ -f ${PWD}/CMakeLists.txt ]; then
        echo "Error: Current directory missing CMakeLists.txt"
        return 1
    fi 

    if [ "$1" = "--clean" ]; then
        rm -rf ./.build
    fi

    cmake -S . -B .build
    cmake --build .build --parallel 8
}

testc() {
    if ! [ -f ${PWD}/CMakeLists.txt ]; then
        echo "Error: Current directory missing CMakeLists.txt"
        return 1
    fi 

    build $1
    cd .build 
    echo ""
    ctest
    cd ..
}

run() {
    if ! [ -f ${PWD}/CMakeLists.txt ]; then
        echo "Error: Current directory missing CMakeLists.txt"
        return 1
    fi 

    exe=${PWD##*/}

    if [ "${@[1]}" = "--build" ]; then
        build
        .build/$exe "${@:2}"
    elif [ "${@[1]}" = "--clean" ]; then
        build --clean
        .build/$exe "${@:2}"
    else 
        .build/$exe "$@"
    fi
}

vmrss() {
    output=($(grep 'VmRSS' "/proc/$1/status"))
    memory=$(echo "scale=2;${output[2]}/1024" | bc)
    output[2]=$memory
    output[3]="MB"
    echo $output
}

export PATH="$PATH:$HOME/.local"
export PATH="$PATH:/snap/bin"

# opam configuration
[[ ! -r /home/dwclake/.opam/opam-init/init.zsh ]] || source /home/dwclake/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

fpath+=${ZDOTDIR:-~}/.zsh_functions

# bun completions
[ -s "/home/dwclake/.bun/_bun" ] && source "/home/dwclake/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# Onyx config
export ONYX_PATH="/home/dwclake/.onyx"
export PATH="$ONYX_PATH/bin:$PATH"

# Wasmer
export WASMER_DIR="/home/dwclake/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
