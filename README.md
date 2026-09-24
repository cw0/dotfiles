# Dotfiles

## Summary

This repo is currently tuned for Arch Linux and uses:

- `kitty` as terminal
- `tmux` with catppuccin
- `vim` + nerd font UI plugins
- `MesloLGSDZ Nerd Font Mono` as the terminal font

If Nerd Font symbols are missing in `vim`/`tmux`, the terminal font is usually the cause.

## Arch Linux Setup

From the repo root:

```bash
chmod +x setup.sh aliases.sh
./setup.sh
```

What this does:

- updates system packages
- installs `yay`
- installs packages from `package-list.txt` (including `ttf-meslo-nerd`)
- links dotfiles into `$HOME` via `aliases.sh`

## Meslo Nerd Font Verification

After install, verify the font exists:

```bash
fc-list | rg -i "Meslo.*Nerd.*Mono"
```

Verify `kitty` is configured to use Meslo:

```bash
rg "^font_family" ~/.config/kitty/kitty.conf
```

Expected:

```text
font_family MesloLGSDZ Nerd Font Mono
```

Optional glyph test (should show icons, not boxes):

```bash
printf '\ue0b0 \ue0b2 \uf013 \uf0e7 \uf659 \uf121\n'
```

## Notes

- `setup.sh` is Arch-focused (`pacman` + `yay`).
- If you customize env vars heavily, copy `.zshrc` instead of symlinking it.
