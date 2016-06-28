parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

ruby_version(){
  RBENV=`rbenv local`
  if [ -n "$RBENV" ]; then
    echo $RBENV
  else
    echo ""
  fi
}

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

elastic(){
   /Library/elastic/bin/elasticsearch -f
}

export JRUBY_OPTS="-J-Xmx4096m -J-Djruby.compile.mode=OFF"

export PS1="\[\033[0;32m\]\u\[\033[00m\]@\t \w \[\e[1;31m\]\$(ruby_version)\[\e[1;31m\]\[\033[32m\]\$(parse_git_branch)\[\033[00m\] \n "
#COLORS
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad
 
# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

#Aliases
alias ll='ls -la'
alias be='bundle exec'
#Git

#RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
