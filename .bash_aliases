alias ls='ls -F --color=auto'
alias ll='ls -lAhF --color=auto'
alias la='ls -lAF --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias pj='ps j'

alias df='df -h'

alias tmux='tmux -2'

alias glog="git log --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gammend='GIT_COMMITTER_DATE=\"`git log -1 --format=%cd`\" git commit --amend'

alias ix="curl -F 'f:1=<-' ix.io"
#alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"

alias irc="mosh agmlego -- screen -xdUS irssi"

alias duc="du --max-depth=1 -ha | sort -rh | sed 's/\.\///' | sed /^0/d"

mkcd () { mkdir -p "$@" && cd "$@"; }

gcd()
{
    # based on https://unix.stackexchange.com/a/97958/60480
    local tmp=$(mktemp)
    local repo_name

    git clone "$@" 2>&1 | tee $tmp
    repo_name=$(awk -F\' '/Cloning into/ {print $2}' $tmp)
    rm $tmp
    printf "changing to directory %s\n" "$repo_name"
    cd "$repo_name"
}

extract () {
    if [ -f "$1" ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar x $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
