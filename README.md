jcp
===
Tired of compiling class paths manually (even using `-cp lib/*.jar`)? 
Here are **J**ava **C**lass **P**ath files...

Usage
-----
Add a file called `class.jcp` to your project and within it, list each
entry on a line by itself:

```
dist/
lib/org-json-b883a848a6.jar
lib/commons-cli-1.2.jar
```

Lines beginning with `#` are comments. Empty lines are ignored. Lines 
with a `!` in front are prepended instead of added to the end of the 
class path.

Installation
------------
Include the JCP shell script in your `.bashrc`:

```sh
. /path/to/jcp.sh
```

If you don't have the Java binaries in your path, you can set the 
`JAVA_HOME` environment variable to the JDK/JRE installation dir, 
e.g. `/path/to/Java/jdk-7u17-windows-i586/`.
