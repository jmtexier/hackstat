#!/bin/sh

MONTH=`date "+%Y-%m"`
DAY=`date "+%Y-%m-%d"`
TIME=`date "+%H:%M"`
FOLDER="/Users/jmtexier/Dev/Jim/hackstat"
cd $FOLDER

FILENAME="stats/$MONTH.txt"

#randomize a bit...
RND=`echo $RANDOM | cut -c 2`
if [ "$RND" = "2" ] || [ "$RND" = "5" ] || [ "$RND" = "7" ] 
then
  #check if file has been already updated today
  UPDATED=`stat -q -n -f "%Sm" -t "%F" $FILENAME`

  if  [ "$DAY" = "$UPDATED" ]
  then
    echo "stats already hacked for today"
  else
    echo "Last update was [$UPDATED] and we are [$DAY], need to hack stats ;)" 
    touch $FILENAME 
    echo "stats for $DAY $TIME" >> $FILENAME
    git add .
    git commit -m "stats for $DAY"
    git push
  fi
else
  echo "we won't update this time... ($RND)"
fi
