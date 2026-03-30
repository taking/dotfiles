# dotfiles 경로
export DOTFILES=$HOME/.dotfiles
export ZSH="$HOME/.oh-my-zsh"

DEFAULT_USER="$USER"
ZSH_THEME="agnoster"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line if you want to change the command execution time
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$DOTFILES

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
  git
  docker
  kubectl
  z
  direnv
  zsh-completions           #1
  zsh-autosuggestions       #2
  zsh-syntax-highlighting   #3
  alias-tips                #4
)

source $ZSH/oh-my-zsh.sh

# Locale 설정
export LC_ALL=ko_KR.UTF-8
export LANG=ko_KR.UTF-8

# History 설정
HISTTIMEFORMAT="[%d.%m.%y] %T   "
export HISTSIZE=10000
export HISTTIMEFORMAT

# Git Username/Email 설정
git config --global user.name "taking"
git config --global user.email "taking@duck.com"

# Git Logs 설정
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.lga "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"

# Git Delta 설정
git config --global core.pager "delta"
git config --global interactive.diffFilter "delta --color-only"
git config --global merge.conflitstyle "diff3"
git config --global diff.colorMoved "default"
git config --global delta.navigate true
git config --global delta.line-numbers true
git config --global delta.side-by-side true

# home / end 키 설정
case $TERM in (xterm*)
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line
esac

mkcd () {
  if [ $# -ne 1 ]; then
    echo 'usage: mkcd <dir-name>'
    return 137
  fi
  # 폴더 생성 후 폴더로 진입
  local dir_name="$1"
  mkdir -p "$dir_name" && cd "$dir_name"
}

extract () {
  if [ $# -ne 1 ] ; then
    echo 'usage: extract <file-name>'
    return 137
  fi
  # 암축 형식의 확장자를 찾아 압축 해제
  case $1 in 
    *.tar.bz2) tar xjf "$1" ;;
    *.tar.gz)  tar xzf "$1" ;;
    *.bz2)     bunzip2 "$1" ;;
    *.rar)     unrar x "$1" ;;
    *.gz)      gunzip "$1" ;;
    *.tar)     tar xf "$1" ;;
    *.tbz2)    tar xjf "$1" ;;
    *.tgz)     tar xzf "$1" ;;
    *.zip)     unzip "$1" ;;
    *.Z)       uncompress "$1" ;;
    *.7z)      7z x "$1" ;;
    *)         echo "cannot extract: $1" ;;    
  esac
}

tree() {
  local depth=2
  local dir="."

  while [[ $# -gt 0 ]]; do
    case "$1" in
      -L)
        depth="$2"
        shift 2
        ;;
      *)
        dir="$1"
        shift
        ;;
    esac
  done

  lsd --tree \
    --depth "$depth" \
    --group-dirs first \
    "$dir"
    # -a \
    # --icon always \
}

up() {
  local n="${1:-1}"
  local target=""
  
  if ! [[ "$n" =~ ^[0-9]+$ ]]; then
    echo "usage: up [number]"
    return 1
  fi

  for ((i=0; i<n; i++)); do
    target+="../"
  done

  cd "$target"
}

fcd() {
  local dir

  dir=$(
    command find . -type d 2>/dev/null \
      | sed 's#^\./##' \
      | grep -v '^\.$' \
      | fzf --height 40% --reverse --prompt='cd> '
  ) || return

  if [[ -z "$dir" ]]; then
    echo "No directories found."
    return 1
  fi

  cd "$dir"
}

ff() {
  local file

  file=$(
    command find . -type f 2>/dev/null \
      | sed 's#^\./##' \
      | fzf --height 40% --reverse --prompt='file> '
  ) || return

  if [[ -z "$file" ]]; then
    echo "No files found."
    return 1
  fi

  echo "$file"
}

br() {
  broot "${1:-.}"
}

# Update external zsh plugins
plugin-update() {
  for d in $ZSH_CUSTOM/plugins/*/.git(/); do
    echo "Updating ${d:h:t}..."
    command git -C "${d:h}" pull --ff --recurse-submodules --depth 1 --rebase --autostash
  done
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
