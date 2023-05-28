# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="takashiyoshida2"
#ZSH_THEME="bureau"
#ZSH_THEME="juanghurtado"
#ZSH_THEME="murilasso"

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
alias vim="nvim"
alias dc="docker-compose"
alias dc-e="docker-compose exec"

export GOROOT=/snap/go/current
export GOPATH=$HOME/go
export ZIGPATH=$HOME/.local/share/zig-linux-x86_64-0.11.0-dev.3301+230ea411f
export NVIMPATH=/snap/nvim/current/usr/bin
export PATH=$GOPATH/bin:$GOROOT/bin:$NVIMPATH:$ZIGPATH:$PATH

export VISUAL=$NVIMPATH/nvim
export EDITOR=$NVIMPATH/nvim

tmsa() {
    tms && tmux attach-session -t "$1"
}

buildfile() {
    if [ -d "src" ] && [ -d "bin" ] && [ "$1" = "" ]; then
        if [ -f "src/main.cpp" ]; then
            g++ -std=c++20 src/main.cpp -o bin/main.exe
        else
            echo "src/main.cpp does not exit, please provide alternative file" 
        fi
    elif [ -d "src" ] && [ -d "bin" ] && [ ! "$1" = "" ]; then
        g++ -Wall -std=c++20 src/$1 -o bin/${1%%.*}.exe 
    elif [ ! -d "bin" ] && [ -d "src" ] && [ "$1" = "" ]; then
        if [ -f "src/main.cpp" ]; then
            echo "Creating bin directory"
            mkdir bin 
            g++ -std=c++20 src/main.cpp -o bin/main.exe 
        else
            echo "src/main.cpp does not exit, please provide alternative file" 
        fi
    elif [ ! -d "bin" ] && [ -d "src" ] && [ ! "$1" = "" ]; then
        echo "Creating bin directory"
        mkdir bin 
        g++ -std=c++20 src/$1 -o bin/${1%%.*}.exe 
    else 
        echo "No source directory"
    fi
}

runfile() {
    if [ -d "src" ] && [ -d "bin" ] && [ "$1" = "" ]; then
        if [ -f "src/main.cpp" ]; then
            buildfile && bin/main.exe 
        else
            echo "src/main.cpp does not exit, please provide alternative file" 
        fi
    elif [ -d "src" ] && [ -d "bin" ] && [ ! "$1" = "" ]; then
        buildfile $1 && bin/${1%%.*}.exe 
    elif [ ! -d "bin" ] && [ -d "src" ] && [ "$1" = "" ]; then
        if [ -f "src/main.cpp" ]; then
            echo "Creating bin directory"
            mkdir bin 
            buildfile && bin/main.exe 
        else
            echo "src/main.cpp does not exit, please provide alternative file" 
        fi
    elif [ ! -d "bin" ] && [ -d "src" ] && [ ! "$1" = "" ]; then
        echo "Creating bin directory"
        mkdir bin 
        buildfile $1 && bin/${1%%.*}.exe 
    else 
        echo "No source directory"
    fi
}

buildproject() { 
    if [ "$1" = "" ]; then
        echo "Argument required: name of executable produced by cmake."
    else
        cmake -S . -B build 
        cmake --build build --parallel 8
        if [ ! -d "bin" ]; then
            mkdir bin
        fi
        mv ./build/$1 ./bin/$1
    fi
}

runproject() {
    if [ "$1" = "" ]; then
        echo "Argument required: name of executable produced by cmake."
    else
        buildproject $1
        bin/$1 $2
    fi
}

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

export CC="/usr/bin/gcc-13"
export CXX="/usr/bin/g++-13"

# Wasmer
export WASMER_DIR="/home/dwclake/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

[ -f "/home/dwclake/.ghcup/env" ] && source "/home/dwclake/.ghcup/env" # ghcup-env

# opam configuration
[[ ! -r /home/dwclake/.opam/opam-init/init.zsh ]] || source /home/dwclake/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
