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
export GOROOT="$HOME/.asdf/installs/golang/1.25.1/go"
export CMAKE_EXE_LINKER_FLAGS="-no-pie -ld64"
export CMAKE_OSX_SYSROOT="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"
export EDITOR="nvim"
#export CC="/opt/homebrew/bin/gcc-14"
#export CXX="/opt/homebrew/bin/g++-14"
#export TOOLCHAINS="swift"

#addToPathFront "$HOME/.local"
#addToPathFront "$HOME/.local/zig"
#addToPathFront "$HOME/.local/nvim/bin"
addToPath "/opt/homebrew/opt/llvm/bin"
addToPath "$HOME/.local/oss-cad-suite/bin"
addToPath "$HOME/.local/qbe"
addToPath "$HOME/.local/bin"
addToPath "$HOME/.asdf/installs/golang/1.25.1/bin"

eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(opam env)"

#PROMPT_EOL_MARK=
