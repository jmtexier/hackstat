#!/bin/sh
CLS='\033c'
BLUE='\033[0;36m'
GRAY='\033[0;37m'
NOCOLOR='\033[0m'

MONTH=`date "+%Y-%m"`
DAY=`date "+%Y-%m-%d"`
TIME=`date "+%H:%M"`
FOLDER="/Users/jmtexier/Dev/Jim/hackstat"
cd $FOLDER

FILENAME="stats/$MONTH.txt"

echo "${CLS}Hackink some github stats?...${BLUE}"
#randomize a bit...
RND=`echo $RANDOM | cut -c 2`
if [ "$RND" = "2" ] || [ "$RND" = "5" ] || [ "$RND" = "7" ] 
then
  #check if file has been already updated today
  UPDATED=`stat -q -n -f "%Sm" -t "%F" $FILENAME`

  if  [ "$DAY" = "$UPDATED" ]
  then
    echo "Nope... stats already hacked for today"
  else
    echo "Last update was [$UPDATED] and we are [$DAY], need to hack stats ;)" 
    git pull
    touch $FILENAME 
    echo "stats for $DAY $TIME" >> $FILENAME
    echo "${GRAY}\c"
    git add .
    git commit -m "stats for $DAY"
    git push
  fi
else
  echo "Nope.. we won't update this time... ($RND)"
fi
echo $NOCOLOR

