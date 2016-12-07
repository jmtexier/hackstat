#!/bin/sh

MONTH=`date "+%Y-%m"`
DAY=`date "+%Y-%m-%d"`
TIME=`date "+%H:%M"`
FOLDER="/Users/jmtexier/Dev/Jim/hackstat"
cd $FOLDER

FILENAME="stats/$MONTH.txt"
touch $FILENAME 
echo "stats for $DAY $TIME" >> $FILENAME

git add .
git commit -m "stats for $DAY"
