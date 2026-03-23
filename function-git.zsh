
git-switch() {
  local branch

  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
    echo "Not inside a git repository."
    return 1
  }

  branch=$(
    git for-each-ref --sort=-committerdate --format='%(refname:short)' refs/heads refs/remotes 2>/dev/null \
      | grep -v 'HEAD$' \
      | sed 's#^origin/##' \
      | sort -u \
      | fzf \
          --height 50% \
          --reverse \
          --prompt='switch> ' \
          --preview 'git log --oneline --decorate --color=always -n 15 {}' \
          --preview-window=right:60%
  ) || return

  if [[ -z "$branch" ]]; then
    echo "No branches found."
    return 1
  fi

  if git show-ref --verify --quiet "refs/heads/$branch"; then
    git switch "$branch"
  else
    git switch -c "$branch" --track "origin/$branch"
  fi
}