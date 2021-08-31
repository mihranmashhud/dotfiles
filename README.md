# · Dotfiles ·

These are my dotfiles each encapsulated as stow packages to be used as needed. Requires `git` and `stow` to be used.

## To install:

Export a `$STOW_FOLDERS` environment variable listing which packages to install. Then run the `install.sh` script. Everything should be symlinked correctly right after.

## To uninstall:

Pretty much the same as installation but instead run the `clean.sh` script.

## Install individual packages:

Just use the `stow` command to install the desired packages. For example:

```bash
stow nvim
```

## Remove individual packages:

Add the `-D` flag. For example:

```bash
stow -D nvim
```
