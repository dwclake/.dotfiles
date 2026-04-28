addToPath() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$PATH:$1  
    fi
}

addToPathFront() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH  
    fi
}

#export LIBRARY_PATH="$LIBRARY_PATH:/opt/homebrew/lib"

export GOPATH="$HOME/.go"
export GOROOT="$HOME/.asdf/installs/golang/1.26.2/go"
export CMAKE_EXE_LINKER_FLAGS="-no-pie -ld64"
export CMAKE_OSX_SYSROOT="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"
export EDITOR="nvim"
#export CC="/opt/homebrew/bin/gcc-14"
#export CXX="/opt/homebrew/bin/g++-14"

addToPathFront "$HOME/.local/nvim/bin"
addToPathFront "$HOME/.local/bin/zls"
addToPathFront "$HOME/.local/oss-cad-suite/bin"
addToPathFront "$HOME/.asdf/installs/golang/1.26.2/bin"
addToPath "/opt/homebrew/opt/llvm/bin"

eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(opam env)"
