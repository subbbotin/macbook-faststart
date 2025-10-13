#!/bin/zsh
set -euo pipefail

ensure_file() { [[ -f "$1" ]] || : > "$1"; }
has_block() { grep -q "$2" "$1"; }
append_block() { printf "\n%s\n" "$3" >> "$1"; }

zshrc="$HOME/.zshrc"
zprofile="$HOME/.zprofile"
ensure_file "$zshrc"
ensure_file "$zprofile"

zshrc_block=$(cat <<'EOF'
# >>> My custom zsh config >>>
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

autoload -U colors && colors
setopt PROMPT_SUBST

NEWLINE=$'\n'

parse_git_branch() {
  git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/@ \1/'
}

export PROMPT='%n: %{$fg[cyan]%}%~ %{$fg[yellow]%}$(parse_git_branch)%{$reset_color%} ${NEWLINE}~ '
# <<< My custom zsh config <<<
EOF
)

if ! has_block "$zshrc" ">>> My custom zsh config >>>"; then
  append_block "$zshrc" "$zshrc_block"
fi

if ! command -v brew >/dev/null 2>&1; then
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$($( (/opt/homebrew/bin/brew || /usr/local/bin/brew) shellenv))"
else
  eval "$($(command -v brew) shellenv)"
fi

token_line=""
if ! grep -q "HOMEBREW_GITHUB_API_TOKEN" "$zprofile"; then
  printf "Enter GitHub API token for Homebrew (leave empty to skip): "
  read -r token
  [[ -n "${token:-}" ]] && token_line="export HOMEBREW_GITHUB_API_TOKEN=\"$token\""
fi

brew_prefix="$(brew --prefix)"
zprofile_block=$(cat <<EOF
# >>> My custom zprofile >>>
eval "\$(brew shellenv)"
export EDITOR='zed --wait'

if type brew &>/dev/null; then
  FPATH=$brew_prefix/share/zsh-completions:\$FPATH
  autoload -Uz compinit
  compinit
fi

${token_line:-}
export NODE_OPTIONS="--max_old_space_size=4096"

alias f='open -a Finder ./'
alias c='clear'
alias myip='curl ipinfo.io/ip'
alias ..='cd ..'
alias npmplease='rm -rf node_modules/ && rm -f package-lock.json && npm install'
alias fixpsql='rm /usr/local/var/postgres/postmaster.pid && brew services restart postgresql'
alias flushdns='sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache'
# <<< My custom zprofile <<<
EOF
)

if ! has_block "$zprofile" ">>> My custom zprofile >>>"; then
  append_block "$zprofile" "$zprofile_block"
fi

brew update
brew upgrade || true
brew cleanup -s || true

formulas=(
  git
  wget
  coreutils
  jq
  ripgrep
  fd
  fzf
  tree
  htop
  mas
)

for f in "${formulas[@]}"; do
  brew list --formula "$f" >/dev/null 2>&1 || brew install "$f" || true
done

casks=(
  adobe-creative-cloud
  bambu-studio
  beekeeper-studio
  figma
  github
  shapr3d
  spotify
  viscosity
  warp
  yandex-music
  zulip
)

for c in "${casks[@]}"; do
  brew list --cask "$c" >/dev/null 2>&1 || brew install --cask "$c" || true
done

if [[ -d "$(brew --prefix)/opt/fzf" ]]; then
  yes | "$(brew --prefix)/opt/fzf/install" --key-bindings --completion --no-bash --no-fish >/dev/null || true
fi
