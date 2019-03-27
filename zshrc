# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel9k/powerlevel9k"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

# Some custom aliases & functions
alias l='ls -lah'
alias gvimr='gvim --remote'
function server() {
  local port="${1:-8000}"
  xdg-open "http://localhost:${port}/"
  python -m SimpleHTTPServer "$port"
}

function pz() {
  zip -r $1 $2 -x \*_unittest\* \*node_modules\* \*.git\* \*gruntfile.js\* \*package.json\* \*README.md\*
}

function homestead() {
    ( cd ~/Homestead && vagrant $* )
}

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:~/bin:/home/users/tommicarleman/.gem/ruby/1.8/bin:~/.composer/vendor/bin
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Turn on 256 color support...
if [ "x$TERM" = "xxterm" ]
then
    export TERM="xterm-256color"
fi

alias curla='curl -A "Mozilla/5.0 (Macintosh; Intel Mac OS X x.y; rv:10.0) Gecko/20100101 Firefox/10.0"'
alias curlad='curl -A "AdsBot-Google (+http://www.google.com/adsbot.html)"'
alias curlg='curl -A "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html +macintosh)"'
alias wgetclone='wget -m -p -E -k -K -np'
alias rscp='rsync -aP'
alias rsmv='rsync -aP --remove-source-files'
if [[ -a ~/.custom_local_rc.sh ]]; then
	source ~/.custom_local_rc.sh
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/Users/tc/bin/Sencha/Cmd:$PATH"
