#!/bin/sh

find . -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.ic" > cscope.files
cscope -bkq -i cscope.files
ctags -R --langmap=c++:+.ic
