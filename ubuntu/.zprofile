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

addToPathFront "$HOME/.local/share/go/bin"
addToPathFront "$HOME/.local"
addToPathFront "$HOME/.local/zig"
addToPathFront "$HOME/.local/nvim/bin"
addToPath "/opt/homebrew/opt/llvm/bin"
addToPath "$HOME/.local/oss-cad-suite/bin"
addToPath "$HOME/.local/qbe"
addToPath "$HOME/.local/bin"
addToPath "$HOME/.local/go/bin"

export VISUAL="$HOME/.local/nvim/bin"
export EDITOR="$HOME/.local/nvim/bin"

export CC="/usr/bin/gcc"
export CXX="/usr/bin/g++"

eval "$(opam env)"

#PROMPT_EOL_MARK=
