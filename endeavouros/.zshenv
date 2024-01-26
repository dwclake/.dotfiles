. "$HOME/.cargo/env"

export GHCITUI="$HOME/.local/state/cabal/store/ghc-9.4.8/ghcitui-0.1.0.0-e-ghcitui-9f44da0f6675dc451605ff08f5826789ddcdd1614d90f7f90f80597d936da680/bin/ghcitui"
export GOROOT=$HOME/.local/go
export GOPATH=$HOME/.local/share/go
export NVIMPATH=/usr/bin/nvim
export OSSCADPATH=$HOME/.local/oss-cad-suite
export SWIFTPATH=$HOME/.local/swift/usr/bin
export ZIGPATH=$HOME/.local/zig
export ZLSPATH=$HOME/.local/zls/zig-out/bin
export PATH=$HOME/.local/go/bin:$GHCITUI:$GOROOT/bin:$GOPATH/bin:$NVIMPATH:$SWIFTPATH:$ODINPATH:$OSSCADPATH/bin:$ZIGPATH:$ZLSPATH:$PATH

export VISUAL=$NVIMPATH
export EDITOR=$NVIMPATH

export PATH="$HOME/.local/share/bin:$PATH"

export CC="/usr/bin/gcc"
export CXX="/usr/bin/g++"

#PROMPT_EOL_MARK=

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

[ -f "/home/dwclake/.ghcup/env" ] && source "/home/dwclake/.ghcup/env" # ghcup-env

# DevkitPro

