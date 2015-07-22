# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="pmcgee"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git rails ruby docker boot2docker ruby gem cp colorize colored-man sbt scala npm pip brew battery tmux cabal)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias tmuxrc="vim ~/.tmux.conf"
alias vimc="~/.vim/docker/run-container.sh"
alias vim="mvim -v"
alias tmuxa='tmux attach-session'
alias tmuxl='tmux list-sessions'

function b2d() {
  echo "Booting up Docker VM..."
  boot2docker up
  export DOCKER_HOST=tcp://`boot2docker ip`:2376
  export DOCKER_CERT_PATH=~/.boot2docker/certs/boot2docker-vm
  export DOCKER_TLS_VERIFY=1
}

# added by travis gem
[ -f /Users/daniel/.travis/travis.sh ] && source /Users/daniel/.travis/travis.sh

function chjava() {
  if [ $# -ne 0 ]; then
    removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
    if [ -n "${JAVA_HOME+x}" ]; then
      removeFromPath $JAVA_HOME
    fi
    export JAVA_HOME=`/usr/libexec/java_home -v $@`
    export PATH=$JAVA_HOME/bin:$PATH
  fi
 }
 function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
 }

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#if [[ -z "$TMUX" && -z "$EMACS" && -z "$VIM" ]]; then
  #tmux start-server

  ## Create a 'toto' session if no session has been defined in tmux.conf.
  #if ! tmux has-session 2> /dev/null; then
    #tmux_session='toto'
    #tmux \
      #new-session -d -s "$tmux_session" \; \
      #set-option -t "$tmux_session" destroy-unattached off &> /dev/null
  #fi

  ## Attach to the 'toto' session or to the last session used.
  #exec tmux attach-session
#fi

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin" 
# Add Cabal to PATH
export PATH="$PATH:$HOME/.cabal/bin"
# Source NVM
export NVM_DIR="/Users/daniel.stankevich/.nvm"
