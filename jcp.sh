#!/bin/sh

if [[ "$OS" =~ Windows ]] ; then
  SEP=";"
else
  SEP=":"
fi

_jcp() {
  JCP=""
  while read line || [ -n "$line" ] ; do
    case $line in
      '#'*)
        ;;
      '!'*)
        JCP=$SEP${line#"!"}$JCP
        ;;
      *)
        JCP=$JCP$SEP$line
        ;;
    esac
  done < class.jcp
  echo ${JCP#$SEP}
}

_jdk() {
  if [ "" = "$JAVA_HOME" ] ; then
    EXE=$(which $EXE)
  else 
    EXE=$JAVA_HOME/bin/$EXE
  fi
  if [ -f class.jcp ] ; then
    $EXE -cp "$(_jcp)" "$@"
  else
    $EXE "$@"
  fi
}

jcp() {
  echo "JCP 1.0 (c) 2013 https://github.com/thekid/jcp"
  EXE=java _jdk -version 2>&1 | head -1
  if [ -f class.jcp ] ; then
    _jcp
  fi
}

java() { 
  EXE=java _jdk "$@" 
}

javac() { 
  EXE=javac _jdk "$@" 
}