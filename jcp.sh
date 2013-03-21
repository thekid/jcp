#!/bin/sh

if [ -d /cygdrive ] ; then
  SEP=";"
else
  SEP=":"
fi

_jdk() {
  if [ "" = "$JAVA_HOME" ] ; then
    EXE=$(which $EXE)
  else 
    EXE=$JAVA_HOME/bin/$EXE
  fi

  if [ -f class.jcp ] ; then
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
    JCP=${JCP#$SEP}

    $EXE -cp "$JCP" "$@"
  else
    $EXE "$@"
  fi
}

java() { 
  EXE=java _jdk "$@" 
}

javac() { 
  EXE=javac _jdk "$@" 
}