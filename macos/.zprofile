
# Setting PATH for Python 3.9
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Setting PATH for Python 3.10
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
export PATH


# Added by Toolbox App
export PATH="$PATH:/Users/devon/Library/Application Support/JetBrains/Toolbox/scripts"

#export EMSDK_QUIET=1
#source ~/emsdk/emsdk_env.sh

eval "$(opam env)"
