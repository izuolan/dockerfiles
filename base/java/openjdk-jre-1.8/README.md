# Java 1.8 JRE Image

This is a small, [Alpine Linux](http://www.alpinelinux.org/) based Docker image
that contains the Java 1.8 JVM. It's useful for executing Java bytecode, but note
that it doesn't contain the JDK, so you can't use it to compile Java code.
Use java-dev to compile code.

## Build

```sh
docker build -t yourname/java:latest .
```

Push:

```sh
docker push yourname/java
```
