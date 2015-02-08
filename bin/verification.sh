#!/bin/bash -eux

echo "\nPHP-FPM running:\n"
ps aux | grep php-fpm | sed 's/^/    /'

echo "\nNGINX running:\n"
/etc/init.d/nginx status | sed 's/^/    /'

echo "\nGIT version:\n"
git --version | sed 's/^/    /'

echo "\nMYSQL running:\n"
mysqladmin -uroot status  | sed 's/^/    /'

echo "\nMONGO running:\n"
status mongodb | sed 's/^/    /'

echo "\nSHELL type:\n"
echo $SHELL | sed 's/^/    /'

echo "\nNODE version:\n"
node --version | sed 's/^/    /'

echo "\nNPM version:\n"
npm --version | sed 's/^/    /'
