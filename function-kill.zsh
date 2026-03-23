
kill-process() {
  local selected pids source_cmd

  if command -v procs >/dev/null 2>&1; then
    source_cmd='procs --no-header'
  else
    source_cmd='ps -ef | sed 1d'
  fi

  selected=$(
    eval "$source_cmd" \
      | fzf \
          --multi \
          --height 75% \
          --reverse \
          --prompt='kill> ' \
          --header='TAB: multi-select / ENTER: choose / ESC: cancel' \
          --preview '
            line="{}"
            pid=$(printf "%s\n" "$line" | awk "{for(i=1;i<=NF;i++) if(\$i ~ /^[0-9]+$/) {print \$i; exit}}")
            if [ -n "$pid" ]; then
              echo "PID: $pid"
              echo
              ps -p "$pid" -o pid=,ppid=,%cpu=,%mem=,etime=,user=,command=
              echo
              lsof -Pan -p "$pid" -i 2>/dev/null | head -30
            else
              echo "$line"
            fi
          ' \
          --preview-window=right:65%:wrap
  ) || return

  [[ -z "$selected" ]] && {
    echo "Cancelled."
    return 1
  }

  pids=$(
    awk '
      {
        for (i=1; i<=NF; i++) {
          if ($i ~ /^[0-9]+$/) {
            print $i
            break
          }
        }
      }
    ' <<< "$selected" | sort -u
  )

  [[ -z "$pids" ]] && {
    echo "No PID found."
    return 1
  }

  echo "Selected PID(s): $(echo "$pids" | tr "\n" " ")"
  read "confirm?Kill selected PID(s)? (y/N): "

  if [[ "$confirm" =~ ^[Yy]$ ]]; then
    echo "$pids" | xargs kill 2>/dev/null || echo "$pids" | xargs kill -9
    echo "Killed."
  else
    echo "Cancelled."
  fi
}

kill-port() {
  local selected pids

  selected=$(
    lsof -nP -iTCP -sTCP:LISTEN 2>/dev/null \
      | sed 1d \
      | fzf \
          --multi \
          --height 75% \
          --reverse \
          --prompt='port> ' \
          --header='TAB: multi-select / ENTER: choose / ESC: cancel' \
          --preview '
            line="{}"
            pid=$(printf "%s\n" "$line" | awk "{print \$2}")
            if [ -n "$pid" ]; then
              echo "PID: $pid"
              echo
              ps -p "$pid" -o pid=,ppid=,%cpu=,%mem=,etime=,user=,command=
              echo
              lsof -Pan -p "$pid" -i 2>/dev/null | head -40
            else
              echo "$line"
            fi
          ' \
          --preview-window=right:65%:wrap
  ) || return

  [[ -z "$selected" ]] && {
    echo "Cancelled."
    return 1
  }

  pids=$(awk '{print $2}' <<< "$selected" | sort -u)

  [[ -z "$pids" ]] && {
    echo "No PID found."
    return 1
  }

  echo "Selected PID(s): $(echo "$pids" | tr '\n' ' ')"
  read "confirm?Kill selected port process(es)? (y/N): "

  if [[ "$confirm" =~ ^[Yy]$ ]]; then
    echo "$pids" | xargs kill 2>/dev/null || echo "$pids" | xargs kill -9
    echo "Killed."
  else
    echo "Cancelled."
  fi
}