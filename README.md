# ghostty-setup

Terminal environment config: [Ghostty](https://ghostty.org) (Catppuccin Macchiato theme, MesloLGS NF font), [starship](https://starship.rs) prompt, and a plain zsh setup (no Oh My Zsh) with `zsh-autosuggestions` and `zoxide`.

## For humans

```bash
git clone <repo-url> ~/code/ghostty-setup
cd ~/code/ghostty-setup
./install.sh
```

Then open a new terminal window (or restart Ghostty) to pick everything up.

`install.sh` will:
1. Run `brew bundle` against `Brewfile` to install Ghostty, the font, starship, zsh-autosuggestions, and zoxide.
2. Symlink `ghostty/config`, `starship.toml`, and `zsh/.zshrc` into place, backing up any existing file first (renamed to `<file>.bak.<timestamp>`, never deleted).

## For AI agents

If you're an AI coding agent asked to bootstrap this environment on a new machine, run:

```bash
git clone <repo-url> "$HOME/code/ghostty-setup"
cd "$HOME/code/ghostty-setup"
./install.sh
```

Notes:
- Check `command -v brew` first. If Homebrew isn't installed, stop and tell the user to install it from https://brew.sh — don't auto-install Homebrew itself without confirmation, since it touches the whole system.
- `install.sh` is idempotent and non-destructive: it backs up any existing `~/.zshrc`, `~/.config/starship.toml`, `~/.config/ghostty/config` before symlinking. Don't delete the `.bak.*` files it creates without asking the user.
- After running, tell the user to open a new terminal/Ghostty window rather than trying to `source ~/.zshrc` in your own non-interactive shell — parts of it assume an interactive zsh session.
- Don't `git push` or modify the remote for this repo without the user's explicit go-ahead.

## What's inside

| File | Purpose |
|---|---|
| `ghostty/config` | Ghostty theme + font |
| `starship.toml` | Prompt config (Catppuccin Macchiato palette) |
| `zsh/.zshrc` | zsh config: completion, zsh-autosuggestions, zoxide, starship, aliases, PATH |
| `Brewfile` | Packages `install.sh` installs |
| `install.sh` | Installs packages, symlinks configs |
