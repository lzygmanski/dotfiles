# Dotfiles

## Fresh macOS setup

Clone the repository:

```sh
git clone https://github.com/lzygmanski/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Install the tools and link the dotfiles:

```sh
sh scripts/macos.sh
```

If existing `.gitconfig`, `.tmux.conf`, or `.zshrc` files are found, they are backed up to:

```sh
~/.dotfiles-backup/
```

Restart the shell:

```sh
exec zsh
```

Check the new shell tools:

```sh
tmux -V
starship --version
zoxide --version
atuin --version
fzf --version
lazygit --version
```

Optional Atuin history sync setup:

```sh
atuin register
atuin import auto
atuin sync
```

## Manual linking

Pull the repository, and then create the symbolic links using [GNU stow](https://www.gnu.org/software/stow/).

```sh
sh scripts/base.sh
```

On macOS, install the base tools first:

```sh
sh scripts/macos.sh
```

## Shell

This setup keeps Zsh but does not use Oh My Zsh. The shell stack is:

- [Starship](https://starship.rs/) for the prompt
- [Zinit](https://github.com/zdharma-continuum/zinit) for Zsh plugins
- [zoxide](https://github.com/ajeetdsouza/zoxide) for smarter directory jumping
- [Atuin](https://atuin.sh/) for shell history
- [fzf](https://github.com/junegunn/fzf) for fuzzy finding
- [lazygit](https://github.com/jesseduffield/lazygit) for terminal Git UI

## Tool examples

### Starship

Starship is configured automatically when Zsh starts. Edit the prompt in:

```sh
nvim ~/.config/starship.toml
```

Reload the shell after changes:

```sh
exec zsh
```

### Zinit

Zinit loads the Zsh plugins from `~/.zshrc`. Update plugins with:

```sh
zinit update
```

List loaded plugins:

```sh
zinit list
```

### zoxide

Use `z` instead of `cd` after visiting directories once:

```sh
cd ~/projects/dotfiles
z dotfiles
z projects
z -
```

### Atuin

Open searchable shell history:

```sh
atuin search
```

Import existing shell history:

```sh
atuin import auto
```

Sync history across machines:

```sh
atuin sync
```

### fzf

Search files interactively:

```sh
fzf
```

Use the shell key bindings:

```sh
Ctrl-r  # command history
Ctrl-t  # files
Alt-c   # directories
```

### lazygit

Open the Git UI inside a repository:

```sh
lazygit
```

### tmux

Start tmux:

```sh
tmux
```

Install tmux plugins after the first launch:

```sh
prefix + I
```

The default prefix is `Ctrl-b`.
