# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="takashiyoshida2"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# diskutil list
# diskutil erasevolume free none disk0s4
# diskutil apfs deletecontainer disk0s4

alias vim="nvim"
alias swift-test="swift test --enable-experimental-swift-testing --disable-xctest"
alias odin-run="odin run src -extra-linker-flags:\"-no-pie -ld_classic\""

export GOPATH="$HOME/.local/share/go"
export OSSCADSUITEPATH="$HOME/.local/oss-cad-suite/bin"
export QBEPATH="$HOME/.local/qbe"
export ZLSPATH="$HOME/.local/zls/zig-out/bin"
export ZIGPATH="$HOME/.local/zig"
export PATH=$HOME/.local/bin:"/opt/homebrew/opt/llvm@14/bin:$GOPATH/bin:$OSSCADSUITEPATH:$QBEPATH:$ZIGPATH:$ZLSPATH:$PATH"

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
    #   -DCMAKE_CXX_COMPILER=$CXX \
        -DCMAKE_C_COMPILER=$CC \
        -DCMAKE_OSX_SYSROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk \
        -DCMAKE_EXE_LINKER_FLAGS="-no-pie -ld_classic"
    cmake --build .build --parallel 8
}

test() {
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
