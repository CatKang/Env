#!/bin/sh
# Generate ctags and cscope index for current directory
# .ic files are parsed as C++ (e.g. PolarDB template implementation files)

find . -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.ic" > cscope.files
cscope -bkq -i cscope.files
ctags -R --langmap=c++:+.ic --exclude=*.js --exclude=*.sql
