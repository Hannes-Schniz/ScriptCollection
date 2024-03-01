# Script references for bash

A collection of script functions to be used in bash scripts.

## Functions

### File generation

This function will create a new file. If the Maximum number of files is hit it will automatically delete the oldest file.

**Variables**

- PATH_TO_LOGFILES: the path to the log folder
- CURRENT_LOGFILE: the name of the current logfile
- MAX_NUM_LOGFILES: the maximum number of logfiles to be created

```
create_File() {

  echo "+------------------+"
  echo "| Creating File |"
  echo "+------------------+"

  NUM_LOGFILES=$(ls $PATH_TO_LOGS -ltr --time=ctime | grep -Po 'telnet-test.*log' | wc -l)

  echo "Logfile at ${PATH_TO_LOGS}/${CURRENT_LOGFILE}"

  if [[ $NUM_LOGFILES == $MAX_NUM_LOGFILES ]]; then
    OLDEST_LOGFILE=$(ls $PATH_TO_LOGS -ltr --time=ctime | grep -Po 'telnet-test.*log' | head -n 1)
    rm $PATH_TO_LOGS/$OLDEST_LOGFILE
  fi
  touch $PATH_TO_LOGS/$CURRENT_LOGFILE

}
```

---

### User input

This function will let the user input information, it allows a validation regex to be passed to validate the user input

**Variables**

- TRANSITION_VAR: A exchange variabe to pass values between functions

```
get_Input()
{
#parameter 1: the input you want to get
#parameter 2: help text
#parameter 3: regex for validation
#returns the user input with validation
	USER_INPUT=""
  local -n HELP=$2
  local -n VALIDATE=$3
	while [[ $USER_INPUT == "?" || $USER_INPUT == "" ]]
	do
		read -p "Please enter the $1: " USER_INPUT
		if [[ $USER_INPUT == "?" ]]; then
			echo $HELP
		fi
    if [[ $USER_INPUT =~ $VALIDATE ]]; then
      TRANSITION_VAR=$USER_INPUT
    else
      USER_INPUT=""
    fi
	done
}
```

---

### Output

This methode will let you draw a border around a one line long string.

```
draw_border ()  {
String="| $1 |"
length=$((${#String} - 2))
border=$(printf '%*s' "$length")
border="+${border// /-}+"
printf "$border\n$String\n$border\n"
}
```

## Methodes

### Dynamically create filled text files

This Methode will let you fill any text file with dynamically generated multiline text using heredoc.

```
cat <<'EOF' >>/tmp/tmpScript.sh
  Text
EOF
```

---

### Cutting Strings

This Methode will allow you to cut a string in two parts and selects one of these parts. It uses a delimiter to cut the two Strings.

```
$(echo "$string" | /bin/cut -d',' -f2)
```

This methode will cut a string by a delimiter into elements bound by the gifen delimiter.

```
IFS=',' read -ra array <<<"$string"
```

---

### Padding strings

This methode will add a amount of spaces at the end of the string to match a given length

```
$(printf '%-6s' $string)
```

---

### File operations

This methode will read the content of a text file and turn it into an array where the elements are defined by linebreaks.

```
OLDIFS=$IFS
  IFS=$'\n'
  lines=($(cat $file))
  for line in ${lines[@]}; do
    IFS=$OLDIFS
```

```
dos2unix -q $file
```
