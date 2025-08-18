# 단축어 설정
alias dc='cd'
alias cls='clear'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='lsd'
alias ll='ls -lh'
alias cat='bat -P --theme Dracula --style="plain"'
alias lv='tspin --print'
alias rec='asciinema rec'

# alias fsize='du -hsx * | sort -rh | head -n 10'
# alias dh='df -h -x tmpfs -x devtmpfs -x squashfs'
alias ttfb='curl -so /dev/null -w "HTTP %{http_version} %{http_code} Remote IP: %{remote_ip}\nConnect: %{time_connect}\nTTFB: %{time_starttransfer}\nTotal time: %{time_total}\nDownload speed: %{speed_download}bps\nBytes: %{size_download}\n"'
alias vi="vi"
alias vim="hx"
alias du='dust'
alias dh='du -s'
alias df='duf -only local,fuse'
alias ps='procs'
alias find='fd'
alias history='fc -il 1'
alias grep='rg'
alias man='tldr'
alias tree='broot -s'
alias gping='gping'
alias top='btm'
alias nnn='nnn -T dst'
alias wport='netstat -p tcp -van | grep LISTEN | grep'
alias weather='curl -s v2.wttr.in/Seoul'
alias info='fastfetch'
alias z='zoxide'

alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias reloadshell="omz reload"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
