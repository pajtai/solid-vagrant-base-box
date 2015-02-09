#!/bin/bash -eu

echo "PHP-FPM running:"
ps aux | grep php-fpm | sed 's/^/    /'

echo "NGINX running:"
/etc/init.d/nginx status | sed 's/^/    /'

echo "GIT version:"
git --version | sed 's/^/    /'

echo "MYSQL running:"
/etc/init.d/mysql status  | sed 's/^/    /'

echo "MONGO running:"
status mongodb | sed 's/^/    /'

echo "SHELL type:"
echo $SHELL | sed 's/^/    /'

echo "NODE version:"
node --version | sed 's/^/    /'

echo "NPM version:"
npm --version | sed 's/^/    /'
