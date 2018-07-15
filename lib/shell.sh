# get current dir
basename $(pwd)

# argument parsing
# https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash

# get last item
dir=$(echo "abc/cd/e/fg/file" | rev | cut -d'/' -f-1 | rev)

# ' become string
# " use variable
'$1'
"$1"
# Hello ''
echo "Hello '$1'"

# check file exist
if [ ! -f dir_name/.gitignore ]; then fi

# check dir exist
if [ -d /kkbox-rdc-personal/kkaudio-cache/songs ]; then fi
[ -d foo ] || mkdir foo

# check null
if [ -z "$2" ]; then fi

# string compare
if [[ "$1" == "f" ]]; then fi

# true/false
if [ "$var" == true ]; then fi

# read lines
readarray song_ids < "$1"
for song_id in ${song_ids[@]}
do
    echo $song_id
done

# [2] of list
cut -d "/" -f 2
# [:2] of list
cut -d "/" -f -2

# find by size, and then remove heading ./
find . -size +1M | sed 's/^.\///g'

### SSH
# ssh remote command
ssh server_ip 'cd ~/Desktop; ls -a'

# mute all output
1>/dev/null 2>&1
