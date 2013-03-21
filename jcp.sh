#!/bin/sh

if [[ "$OS" =~ Windows ]] ; then
  SEP=";"
else
  SEP=":"
fi

_jcp() {
  JCP=${CLASSPATH-"."}
  if [ -f class.jcp ] ; then
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
  fi
  echo ${JCP#$SEP}
}

_jdk() {
  if [ "" = "$JAVA_HOME" ] ; then
    EXE=$(which $EXE)
  else 
    EXE=$JAVA_HOME/bin/$EXE
  fi
  $EXE -cp "$(_jcp)" "$@"
}

jcp() {
  echo "JCP 1.0 (c) 2013 https://github.com/thekid/jcp"
  EXE=java _jdk -version 2>&1 | head -1
  _jcp
}

java() {
  EXE=java _jdk "$@"
}

jar() {
  EXE=jar _jdk "$@"
}

javac() {
  EXE=javac _jdk "$@"
}