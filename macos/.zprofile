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

eval "$(/opt/homebrew/bin/brew shellenv)"

#export EMSDK_QUIET=1
#source ~/emsdk/emsdk_env.sh

eval "$(opam env)"

addToPathFront "$HOME/.local/share/go/bin"
addToPathFront "$HOME/.local"
addToPathFront "$HOME/.local/zig"
addToPathFront "$HOME/.local/nvim/bin"
addToPath "/opt/homebrew/opt/llvm/bin"
addToPath "$HOME/.local/oss-cad-suite/bin"
addToPath "$HOME/.local/qbe"
addToPath "$HOME/.local/bin"

export CMAKE_EXE_LINKER_FLAGS="-no-pie -ld64"
export CMAKE_OSX_SYSROOT="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"
export EDITOR="nvim"
export CC="/opt/homebrew/bin/gcc-13"
export CXX="/opt/homebrew/bin/g++-13"
export TOOLCHAINS="swift"

#PROMPT_EOL_MARK=
