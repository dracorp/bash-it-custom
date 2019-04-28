# bash-lib

Various Bash functions. It could be used as a library.

## 00-env-functions.plugin.bash

A set of functions to manipulate environemt variables.

* _add2env - adds to env variable
* _rm4env  - removes from env variable

To add new variable simple use syntax:

    NODE_PATH="$HOME/opt/npm"

And then use syntax:

    _add2env $NODE_PATH/bin

It'll add a new value to the PATH at the end if not exist. You can use also use
syntax:

    _add2env value
    _add2env variable value
    _add2env variable value separator
    _add2env variable=value

In simplified form, this is a substitute for the syntax:

    variable=$variable:value

But with a pinch of magic.

Some samples:
```
$ echo $VAR

$ _add2env VAR=foo
$ echo $VAR
foo
$ _add2env VAR=bar
$ echo $VAR
bar
$ _add2env VAR+=post
$ echo $VAR
bar:post
$ _add2env VAR=+pre
$ echo $VAR
pre:bar:post
$ _add2env VAR add_to_end
$ echo $VAR
pre:bar:post:add_to_end
$ _add2env VAR=assign
$ echo $VAR
assign
```

_rm4env works similarly.

```
$ _add2env VAR=pre:bar:post:add_to_end
$ _rm4env VAR bar
$ echo $VAR
pre:post:add_to_end
$ _rm4env VAR pre:post
$ echo $VAR
add_to_end
$ _rm4env VAR=assign
$ echo $VAR
assign

$ _add2env VAR=pre:bar:post:add_to_end
$ _rm4env VAR bar ,
$ echo $VAR
pre:bar:post:add_to_end
$ _rm4env VAR bar 
$ echo $VAR
pre:post:add_to_end
$ _rm4env VAR pre:post
$ echo $VAR
add_to_end
```
### Debug

Set `DEBUG_DEVEL=1` to see more.

```
$ VAR=foo:bar
$ DEBUG_DEVEL=1
$ _add2env VAR add
modification: post, variable: VAR, separator :, value: add
eval VAR=foo:bar:add
export VAR
$ _add2env VAR=assign
modification: assign, variable: VAR, separator :, value: assign
eval VAR=assign
export VAR
$ _rm4env VAR assign
modification: remove, variable: VAR, separator :, value: assign
eval VAR=
export VAR
$ echo $VAR

$ 
```

### ~ tilde

Tilde is always expanded.

    _add2env VAR="~/tmp"
    _add2env VAR=~/log
    $ echo $VAR
    /home/dracorp/tmp:/home/dracorp/log
    
### TODO

- [x] handle operators **+=** and **=+**
- [x] handle correctlly operator **=**, probably it should assign instead of appending
- [ ] there is an issue with a space in the value

### Issues

```
$ VAR=foo:bar,bar
$ _rm4env VAR bar
$ echo $VAR
foo:bar,bar
$ _rm4env VAR foo
$ echo $VAR
bar,bar
```
