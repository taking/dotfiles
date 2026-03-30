# 단축어 설정
alias dc='cd'
alias cls='clear'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='lsd --icon always'
alias ll='lsd -l --icon always'
alias la='lsd -la --icon always'
alias lt='lsd --tree --depth 2 --icon always'
alias cat='bat -P --theme Dracula --style="plain"'
alias lv='tspin --print'
alias rec='asciinema rec'

# editor
export ZELLIJ_CONFIG_DIR="$HOME/.config/zellij"
export EDITOR="hx"
export VISUAL="hx"

alias v='hx'
alias vi='hx'
alias vim='hx'

alias zc='zellij -l code'
alias zf='zff'
alias zd='zcd'
alias zjl='zellij list-sessions'
alias zjk='zellij kill-session'

# alias fsize='du -hsx * | sort -rh | head -n 10'
# alias dh='df -h -x tmpfs -x devtmpfs -x squashfs'
alias ttfb='curl -so /dev/null -w "HTTP %{http_version} %{http_code} Remote IP: %{remote_ip}\nConnect: %{time_connect}\nTTFB: %{time_starttransfer}\nTotal time: %{time_total}\nDownload speed: %{speed_download}bps\nBytes: %{size_download}\n"'
alias du='dust'
alias dh='du -s'
alias df='duf -only local,fuse'
alias ps='procs'
alias find='fd'
alias history='fc -il 1'
alias grep='rg'
alias man='tldr'
alias gping='gping'
alias top='btm'
alias nnn='nnn -T dst'
alias wport='netstat -p tcp -van | grep LISTEN | grep'
alias weather='curl -s v2.wttr.in/Seoul'
alias info='fastfetch'
alias z='zoxide'

alias reloadshell="omz reload"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

export KUBECONFIG=$(printf "%s:" ~/.kube/config.d/*-config | sed 's/:$//')
