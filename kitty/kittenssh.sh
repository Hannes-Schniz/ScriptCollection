#!/bin/zsh

if [ ! -n $LOGS ]; then
    echo "LOGS env not set"
    exit 1
fi
if [ ! -d "$LOGS/ssh" ]; then
    echo "$LOGS/ssh folder does not exist"
    exit 1
fi


file="$LOGS/ssh/kittenssh_$(date +%Y%m%d%H%M%s).log"
tmp_file="$file.tmp"
kitty --dump-commands kitten ssh $1 > $tmp_file 

command=""
collecting=0

while IFS= read -r line || [[ -n "$line" ]]; do
  if [[ "$line" =~ ^draw\  ]]; then
    # Extract the part after 'draw '
    char="${line:5}"
    # Only keep if all characters are printable (ASCII 32-126)
    if [[ "$char" =~ ^[[:print:]]+$ ]]; then
      command+="$char"
    fi
  elif [[ "$line" == "screen_carriage_return" ]]; then
    collecting=1
    if [[ -n "$command" ]]; then
      printf "%s\n" "$command" >> $file
      command=""
    fi
  fi
done < "$tmp_file"
rm $tmp_file
