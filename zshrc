autoload -U promptinit; promptinit
prompt pure

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

[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

function homestead() {
    ( cd ~/Homestead && vagrant $* )
}

# Customize to your needs...
export PATH=$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:~/bin:/home/users/tommicarleman/.gem/ruby/1.8/bin:~/.composer/vendor/bin
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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
