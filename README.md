# dotzsh

Zsh utilities to be added to a `~/.zshrc` file.

Once installed run `dzh` for dotzsh help.

## usage

```sh
# top of file content
autoload -Uz compinit
compinit

# sourcing all the utility files
for config in ~/.config/zsh/*.zsh; do
  source config
done

# rest of file content
eval "$(...)"
export PATH="$PATH:..."
```
