#! /usr/bin/bash

package_mecab="http://mecab.googlecode.com/files/mecab-0.98.tar.gz"
package_ipadic="http://mecab.googlecode.com/files/mecab-ipadic-2.7.0-20070801.tar.gz"

function warn {
  # color:yellow
  echo -e "\033[33mWarning\033[m" "$*"
}

function error {
  # color:red
  echo -e "\033[31mError\033[m" "$*"
}

function success {
  # color:green
  echo -e "\033[32mSuccess\033[m" "$*"
}

function check_available {
  which "$1" &>/dev/null
  return $?
}

function check_os {
  case ${OSTYPE} in
  cygwin* )
    success "The system is $OSTYPE"
    ;;
  * )
    warn "$OSTYPE is NOT supported, exitting"
    exit 1
    ;;
  esac
}

function check {
    check_os &&
    check_available wget || error "wget is not installed, exitting"; exit 1
    check_available tar  || error "tar is not installed, exitting" ; exit 1
}

function install_mecab {
  local tarball="$(basename package_mecab)"
  local archive="${tarball%.tar.gz}"
  cd /usr/src
  echo "install mecab..."
  wget "$package_mecab" &&
  tar zxf "$tarball" &&
  cd "$archive" &&
  ./configure CPPFLAGS=-DNOMINMAX LIBS="-liconv" --with-charset=utf8 &&
  make &&
  make install &&
}

function install_ipadic {
  local tarball="$(basename package_ipadic)"
  local archive="${tarball%.tar.gz}"
  cd /usr/src
  echo "install ipa dic..."
  wget "$package_ipadic" &&
  tar zxf "$tarball" &&
  cd "$archive" &&
  ./configure  --with-charset=utf8 &&
  make &&
  make install &&
}

function install {
  install_mecab
  install_ipadic
}

check
install