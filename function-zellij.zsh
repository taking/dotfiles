zproj() {
  # 현재 디렉토리 이름을 세션 이름으로 사용
  local session_name
  session_name=$(basename "$PWD")

  # git repo라면 repo 이름으로 (더 안정적)
  if git rev-parse --show-toplevel &>/dev/null; then
    session_name=$(basename "$(git rev-parse --show-toplevel)")
  fi

  # 이미 세션이 있으면 attach
  if zellij list-sessions | grep -q "^$session_name "; then
    zellij attach "$session_name"
    return
  fi

  # 없으면 새로 생성 (code layout 적용)
  zellij attach "$session_name" -c --layout code
}

# project file picker -> open in helix
zff() {
  local file

  file=$(
    fd --type f --hidden --follow \
      --exclude .git \
      --exclude node_modules \
      --exclude .turbo \
      --exclude dist \
      --exclude build \
      --exclude .next \
      --exclude target \
    | fzf \
        --height=100% \
        --layout=reverse \
        --border \
        --prompt='File > ' \
        --preview 'bat -P --theme Dracula --style="plain" --color=always {}' \
        --preview-window 'right:60%' \
        --bind 'ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'
  ) || return

  hx "$file"
}

# project directory picker -> cd
zcd() {
  local dir

  dir=$(
    fd --type d --hidden --follow \
      --exclude .git \
      --exclude node_modules \
      --exclude .turbo \
      --exclude dist \
      --exclude build \
      --exclude .next \
      --exclude target \
    | fzf \
        --height=100% \
        --layout=reverse \
        --border \
        --prompt='Dir > ' \
        --preview 'lsd -la --icon never {} 2>/dev/null || ls -la {}' \
        --preview-window 'right:60%'
  ) || return

  cd "$dir"
}