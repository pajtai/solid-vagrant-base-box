define solid::apt {
  include apt
  apt::ppa { 'ppa:git-core/ppa': }
#  apt::ppa { 'ppa:ondrej/mysql-5.6': }
  apt::ppa { 'ppa:ondrej/php5': }
  apt::ppa { 'ppa:chris-lea/node.js': }
}