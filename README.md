# Bud is the new Make

When you start a project, you have snippets of shell commands that you want to run against your project: e.g. to build, to test, to deploy, etc.

Makefile can do the job, but it has many limitations when using for this purpose. To name a few:

* Can't pass arguments on the command line
* Can't reference other make target
* Make target cannot use the same name as a file

Rather than work around these limitations, why not just define a bash script with bash functions that runs your command and execute these functions at will?

And it would be nice if we have autocompletion as well.

That is what Bud does.

## Installation

If you want to give it a try, you can just grab the file `bud` and run it from anywhere.

It's recommended to copy it under somewhere like `/usr/local/bin/` where you can call it without specifying the full path. e.g. `cp bud /usr/local/bin/`

To use autocompletion, source the file `bud_completer.sh` from your shell startup file. e.g. `echo "source $PWD/bud_completer.sh" >> ~/.bashrc`

## Usage

Create a file called `Budfile`, you can try something like this:

```
#!/bin/bash

function build() {
    echo "Building $*..."
}

function test() {
    echo "Running Tests..."
}

function fail_on_error() {
    set -e   # fail on error
    build $*
    test
    false
    echo "can't see me"
}

function details() {
    set -x   # show everything
    build $*
    if [ $? -eq 0 ]; then
        test
    fi
}
```

Run `bud` against any of your functions, pass arguments as you like:

```
bud build
bud build myfile another_file
bud test
bud fail_on_error 1 2 3
bud details
```

If you have autocomplete, you can press `<tab>` to auto complete your function name. E.g. `bud b<tab>` -> `bud build`
