# ELM Sandbox

* [ELM](https://guide.elm-lang.org/)
* [Beginning Elm](https://elmprogramming.com/)


> **Note**: Elm programming language itself is written in another language called [Haskell](https://www.haskell.org/).

### How to compile
```shell
elm make <elm file>
```

Ex:
```shell
elm make src/Main.elm
```

### How to compile to JavaScript
```shell
elm make <elm file> --output elm.js
```

Ex:
```shell
elm make src/Main.elm --output elm.js
```

### How to build and launch project
```shell
elm reactor
```

### How to go to wrapper mode

```shell
elm repl
```

### How to go out from wrapper mode
```
Ctrl + d
```

or

```
:exit
```

### How to install package
```shell
elm install <publisher>/<package-name>
```
Ex:
```shell
elm install elm/http
```