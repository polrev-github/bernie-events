#! /bin/bash
DATE=`date +%Y-%m-%d:%H:%M:%S`
BERNIE_EVENTS_FOLDER=/Library/Php/Projects/Microsites/bernie-events
BERNIE_DATA_FOLDER=/Library/Php/Projects/Microsites/bernie-events/d

echo "--------------------------------------------"
echo "$DATE | Bernie 2016 Events Data Pull - START"
echo "--------------------------------------------"

cd $BERNIE_DATA_FOLDER
curl "https://go.berniesanders.com/page/event/search_results?format=json&wrap=no&orderby\[0\]=date&orderby\[1\]=desc&event_type=13&mime=text/json&limit=3000&country=*" > "july29.json"

sleep 2
cd $BERNIE_EVENTS_FOLDER

git add "d/july29.json"

sleep 2

git commit -m "Updating july29 data"

sleep 2

git push origin master

echo "--------------------------------------------"
echo "$DATE | Bernie 2016 Events Data Pull - FINISH"
echo "--------------------------------------------"
