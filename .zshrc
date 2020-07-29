# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/jaroberts/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man colorize pip python brew osx zsh-syntax-highlighting fly chucknorris aws kubectl)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.


# Setting Java_Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_191.jdk/Contents/Home

# Maven Settings
export M2_HOME=/usr/local/Cellar/maven/3.6.0/libexec
export M2=$M2_HOME/bin
export PATH=$PATH:$M2_HOME/bin:/usr/local/sbin


bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

# Docker
alias dcl="docker container ls"
alias stopall="docker stop $(docker ps -a -q)"
alias rmall="docker rm $(docker ps -a -q)"

# Docker Compose
alias down="docker-compose down || true"
alias build="docker-compose up -d --build"
alias up="docker-compose up -d"
alias logs="docker-compose logs"
alias logsf="docker-compose logs -f"

## Git
alias gs='git status'
alias gd='git diff'
alias gdd='git diff --cached'
alias gdm='git diff origin/master --'
alias gco='git checkout'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gcm='git commit -m'
alias gin='git init'
alias gdi='git diff --ignore-space-change'
alias gsp='git stash && git pull --rebase'
alias gspp='git stash && git pull --rebase && git stash pop'
alias gist='git stash'
alias gistp='git stash pop'
alias gista='gits tash apply'
alias gists='gist stash save'

# Maven builds
alias mct='mvn clean test'
alias mcp='mvn clean package'
alias mci='mvn clean install'
alias mcv='mvn clean verify'

alias mcis='mvn clean install -DskipTests'
alias mciss='mvn clean install -Dmaven.test.skip'
alias mcid='mvn clean install -Dmaven.surefire.debug'

# JGitFlow
alias fs='mvn jgitflow:feature-start'
alias ff='mvn jgitflow:feature-finish'
alias rs='mvn jgitflow:release-start'
alias rf='mvn jgitflow:release-finish'
alias hs='mvn jgitflow:hotfix-start'
alias hf='mvn jgitflow:hotfix-start'

# Shell Commands
alias l='colorls'
alias ls='colorls'
alias la='colorls -al'
alias rc="atom ~/.zshrc"
alias ohmy="atom ~/.oh-my-zsh"

alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

### AWS
alias dev='aws-okta exec dev --'
alias dk='aws-okta exec dev -- kubectl'
alias dhd='aws-okta exec dev -- helm delete'
alias dhi='aws-okta exec dev -- helm install'

alias nonprod='aws-okta exec nonprod --'
alias nk='aws-okta exec nonprod -- kubectl'

alias prod='aws-okta exec prod --'
alias pk='aws-okta exec prod -- kubectl'

alias kg='kubectl get'
alias kgp='kubectl get pod'
alias kr='kubectl run'
alias kc='kubectl config'
alias kcsc='kc set-context $(kc current-context) --namespace=$1'
alias kga='kubectl get all --all-namespaces'
alias kd='kubectl delete'
alias kda='kubectl delete all --all'

alias dhd='dev helm delete'
alias dhi='dev helm install'
alias dhl='dev helm ls'
alias dhs='dev helm search'


## Functions
function rkp (){
  for process in $(ps -e | grep "kubectl proxy" | awk '{print $1}')
    do
      kill $process
    done
  aws-okta exec dev -- kubectl proxy &
}

function krp (){
    kr $1 --restart=Never --image=${@:2}
}

function krpy (){
    kr $1 --restart=Never --dry-run -o yaml --image=${@:2}  >> $1.yaml
}

function krj (){
    kr $1 --restart=OnFailure --image=${@:2}
}

function krjy (){
    kr $1 --restart=OnFailure --dry-run -o yaml --image=${@:2}  >> $1.yaml
}
function krd (){
    kr $1 --image=${@:2}
}

function krdy (){
    kr $1 --dry-run -o yaml --image=${@:2}  >> $1.yaml
}

# Fly auto-complete
export -f killkp
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/fly-completion.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# export JAVA_HOME=`/usr/libexec/java_home -v 13`
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jaroberts/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jaroberts/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jaroberts/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jaroberts/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="$HOME/.tfenv/bin:$PATH"
