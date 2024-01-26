. "$HOME/.cargo/env"

export GOPATH="$HOME/.local/share/go"
export OSSCADSUITEPATH="$HOME/.local/oss-cad-suite/bin"
export ZLSPATH="$HOME/.local/zls/zig-out/bin"
export ZIGPATH="$HOME/.local/zig"
export PATH="/opt/homebrew/opt/llvm@14/bin:$GOPATH/bin:$OSSCADSUITEPATH:$ZIGPATH:$ZLSPATH:$PATH"

export CMAKE_EXE_LINKER_FLAGS="-no-pie -ld64"
export CMAKE_OSX_SYSROOT="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"
export EDITOR="nvim"
export CC="/opt/homebrew/bin/gcc-13"
export CXX="/opt/homebrew/bin/g++-13"
export TOOLCHAINS="swift"

#PROMPT_EOL_MARK=

# opam configuration
[[ ! -r /Users/dwclake/.opam/opam-init/init.zsh ]] || source /Users/dwclake/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

. $HOME/.asdf/asdf.sh

export DEVKITPRO="/opt/devkitpro"
export DEVKITARM="$DEVKITPRO/devkitARM"

# bun completions
[ -s "/Users/dwclake/.bun/_bun" ] && source "/Users/dwclake/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Wasmer
export WASMER_DIR="/Users/dwclake/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# Onyx config
export ONYX_PATH="/Users/dwclake/.onyx"
export PATH="$ONYX_PATH/bin:$PATH"

[ -f "/Users/dwclake/.ghcup/env" ] && source "/Users/dwclake/.ghcup/env" # ghcup-env
