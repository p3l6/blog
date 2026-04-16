---
title: Bash
---

## Argument Variables <!-- Variable -->

| Variable | References                                |
|----------|-------------------------------------------|
| `$#` | number of command-line arguments given. |
| `$?` | exit value of the last command that was executed. |
| `$0` | the command run by the user ( zeroth argument ). |
| `$x` | x'th argument of the command, eg $1, $2. |
| `$*` | all the arguments ($1 $2 ...). when quoted, single string. |
| `$@` | all the arguments, when quoted, individual strings ("$1" "$2" ...). |
| `$$` | process number for shell or script executing. |
| `$!` | process number of the last background command. |

## History <!-- Section -->

* use ctrl-r to reverse search history semi-interactively
* `history 10:` print 10 histroy items
* `!<something>:p` print without executing

```
cmd arg  arg  arg  arg
    !^             !$
    |----- !* -------|
|------- !! ---------|
```

| Variable | References                                |
|----------|-------------------------------------------|
| `!!`     | last command |
| `!baz`   | last command that starts with baz |
| `!?baz`  | last command containing baz |
| `!300`   | history item 300 |
| `!$`     | the last argument of the previous command |
| `!^`     | first arg of prev command |
| `!:2`    | second arg of prev command |
| `!*`     | all arguments of the last command |


## Directory containing script <!-- Command -->

```bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
```

## Switch case <!-- Builtin -->

```bash
case $1 in
  --help)
    usage
    ;;
  string)
    someFlag=1
    ;;
  opt|other)
    two options
    ;;
  *)
    unmatched stuff
esac
```

## Loop <!-- Builtin -->

```bash
for i in $(seq 1 7); do

done

# not portable
for i in {1..7}; do
done

# update command progress
for pc in $(seq 1 100); do
  sleep 1
  echo -ne "updating $pc%\r"
done
```

## Colorized output <!-- Command -->

```bash
$(tput setaf 1) <text here> $(tput sgr0) # Standard colors
\[\e[0;32m\]  <this is in color 0;32>  \[\e[m\] # Any color
```

Standard colors:
- `1` red
- `2` green
- `3` yellow
- `4` blue
- `5` purple
- `6` light
- `7` white

## Template with argument parsing <!-- File -->

This script will set flags based on args, then treat the first real arg as a filename.
Or, read from stdin if no real arg is provided

```bash
# Show usage and exit if no arguments.
if [ "$#" = 0 ]; then
  echo usage
fi

# Parse options.
while :; do
  case $1 in
    --help)
      usage
      ;;
    --someFlag)
      someFlag=1
      ;;
    *) break
  esac
  shift
done

# Get the content from FILENAME or stdin.
content="$(cat "${1:-/dev/stdin}")"
```

## Template for task automation  <!-- File -->

To bootstrap an automation script, start with just asking the user to complete all steps.
Gradually replace steps with actual automation, as nessesary.

```bash
#! /bin/bash

echo -n "--> Please do step 1 "
read

echo -n "--> Please do step 2 "
read

echo “Finished”
```

## Heredocs  <!-- Builtin -->

Heredocs are used to include a document in place. The contents will be passed to a command via stdin.

The delimeter is traditionally `EOF`, but any string can be used if EOF appears in the contents.

Placing quotes around the starting delimiter (`<<'EOF'`) will prevent variable substitution in the contents.

### Basic form
```bash
_command_ <<EOF
multi line
long text block
EOF
```

### Often used for a script's help information.
```bash
cat <<EOF
usage information: $0
-a  arg one
-b  arg two
EOF
```

### Print contents to a file

```bash
cat <<EOF > ./file.txt
some stuff
EOF
```

### Single line variation
```bash
_command_ <<<"single line string"
# Equivalent to:
echo "single line string" | _command_
```

## Conditionals <!-- Builtin -->

| Flag | True if file ... |
|------|------------------|
| -a, -e | exists |
|  -r | is readable |
|  -w | is writable |
|  -x | is exists and is executable |
|  -O | is owned by the effective user ID  |
|  -G | is owned by the effective group ID |
|  -d | is a directory |
|  -f | is a regular file |
|  -h, -L | is a symbolic link |
|  -S | is a socket |
|  -b | is a block-special |
|  -c | is a character-special |
|  -p | is a named pipe, |
|  -N | is modified since read |
| -g | has its SGID bit set,-k sticky bit is set |
| -s | has a size greater than zero |
| -u | has its SUID bit set |
| -t | descriptor is open refers to a terminal |

| Operator | Meaning |
|----------|---------|
| -nt | left changed more recently than right |
| -ot | left is older than right |
| -et | left and right have the same inode |
| -z | length of string is zero |
| -n | length of string is non-zero |
| == | *strings* equal |
| != | *strings* not equal |
| <  | left *string* sorts before right *string* |
| -eq -ne -lt -le -gt -ge | *integer* comparison |
| ! | not |
| -a | and |
| -o | or |
