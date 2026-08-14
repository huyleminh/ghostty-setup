# --- Completion ---
autoload -Uz compinit && compinit

# --- Word navigation ---
# Drop "/" from WORDCHARS so Option+Delete stops at path separators
# (e.g. `cd ~/code/work/dbml` only removes "dbml", not the whole path)
WORDCHARS=${WORDCHARS//\//}

# --- Plugins ---
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
eval "$(zoxide init zsh)"

# --- Prompt ---
eval "$(starship init zsh)"

# --- git aliases ---
alias gst="git status"
alias gco="git checkout"
alias gbr="git branch"
alias ga="git add"
alias gcm="git commit -m"
alias gf="git fetch"
alias gp="git push"
alias gt="git tag"
alias gl="git pull"
alias gm="git merge"
alias glg="git log"
alias grb="git rebase"

# --- terminal aliases ---
alias cls="clear"
alias ll="ls -l"
alias lla="ls -la"
alias llha="ls -lha"

# --- environment / PATH ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="$HOME/Library/Python/3.12/bin:$PATH"

# vscode code command
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"; fi

. "$HOME/.local/bin/env"
export PATH="/opt/homebrew/opt/gnu-getopt/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# yarn
export PATH="$HOME/.yarn/bin:$PATH"

# Added by Holistics CLI installer
export PATH="$HOME/.holistics/bin:$PATH"
