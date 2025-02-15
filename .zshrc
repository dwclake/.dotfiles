export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="takashiyoshida2"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# diskutil list
# diskutil erasevolume free none disk0s4
# diskutil apfs deletecontainer disk0s4

alias vim="nvim"
alias swift-test="swift test --enable-experimental-swift-testing --disable-xctest"

export PATH="$PATH:$HOME/.local"

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

    cmake -S . -B .build \
        #-DCMAKE_CXX_COMPILER=$CXX \
        #-DCMAKE_C_COMPILER=$CC \
        #-DCMAKE_OSX_SYSROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk \
        #-DCMAKE_EXE_LINKER_FLAGS="-no-pie -ld_classic"
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

# opam configuration
[[ ! -r /Users/dwclake/.opam/opam-init/init.zsh ]] || source /Users/dwclake/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

. $HOME/.asdf/asdf.sh

export DEVKITPRO="/opt/devkitpro"
export DEVKITARM="$DEVKITPRO/devkitARM"

# bun completions
[ -s "/Users/dwclake/.bun/_bun" ] && source "/Users/dwclake/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$PATH:$BUN_INSTALL/bin"

# Wasmer
export WASMER_DIR="/Users/dwclake/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/dwclake/.lmstudio/bin"
