# 단축어 설정
alias dc='cd'
alias cls='clear'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='lsd -lh'
alias cat='bat'
# alias fsize='du -hsx * | sort -rh | head -n 10'
# alias dh='df -h -x tmpfs -x devtmpfs -x squashfs'
alias ttfb='curl -so /dev/null -w "HTTP %{http_version} %{http_code} Remote IP: %{remote_ip}\nConnect: %{time_connect}\nTTFB: %{time_starttransfer}\nTotal time: %{time_total}\nDownload speed: %{speed_download}bps\nBytes: %{size_download}\n"'
alias vi="hx"
alias vim="hx"
alias du='dust'
alias dh='du -sH'
alias df='duf'
alias curl='curlie'
alias ps='procs'
alias find='fd'

alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias reloadshell="omz reload"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

alias mac-backup="mackup backup"
alias mac-restore="mackup restore"