# Mktags
Generate ctags and cscope index for current directory

## Usage
sh mktags.sh

This will generate `tags` and `cscope.out` under current directory,
which will be loaded by vim automatically.

- `.h .c .cc .ic` files are indexed by cscope
- `.ic` files are parsed as C++ by ctags
- `*.js` and `*.sql` files are excluded from ctags
