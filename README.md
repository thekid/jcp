jcp
===
Tired of compiling class paths manually (even using `-cp lib/*.jar`)? Here are **J**ava **C**lass **P**ath files...

Usage
-----
Add a file called `class.jcp` to your project and within it, list each entry on a line
by itself:

```
dist/
lib/org-json-b883a848a6.jar
lib/commons-cli-1.2.jar
```

Lines beginning with `#` are comments. Empty lines are ignored. Lines with a `!` in 
front are prepended instead of added to the end of the class path.

Installation
------------
Add the "java" and "javac" wrappers from the `bin/` directory to your `$PATH` *before*
the Java binaries appear. Test with `which java[c]` to verify the wrappers are executed!
If you don't have Java binaries in your path, you can set the `JAVA_HOME` environment 
variable.
