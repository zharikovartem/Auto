#!/bin/bash

paragraphs=()

while read line
do
  paragraphs+=("$line")
done < <(curl -s -v -H "Content-Type: text/html" -X GET -u a.zharikov@krios.by:gfhjkm4501 https://redmine.smartdesign.by/projects/mail-trade-crm-v-2/issues\?utf8=%E2%9C%93\&set_filter=1\&f%5B%5D=status_id\&op%5Bstatus_id%5D=%3D\&v%5Bstatus_id%5D%5B%5D=1\&v%5Bstatus_id%5D%5B%5D=7\&v%5Bstatus_id%5D%5B%5D=2\&f%5B%5D=assigned_to_id\&op%5Bassigned_to_id%5D=%3D\&v%5Bassigned_to_id%5D%5B%5D=me\&f%5B%5D=&c%5B%5D=tracker\&c%5B%5D=status\&c%5B%5D=priority\&c%5B%5D=subject\&c%5B%5D=author\&c%5B%5D=assigned_to\&c%5B%5D=fixed_version\&c%5B%5D=estimated_hours\&c%5B%5D=spent_hours\&c%5B%5D=done_ratio\&group_by= | grep "subject" | 
    sed 's/<div class=\"item_description\" itemprop=\"description\">/\ /;s/<\/div>/\n/')

clear

ITER=0
SUB='<a href="/issues/'
branchNames=()

echo "Выберите задачу: "
for paragraph in "${paragraphs[@]}"
do
#   echo -e  " \e[30;48;5;82m ${ITER}) \e[0;49m $paragraph"
  if [[ $paragraph =~ .*"$SUB".* ]]
    then
    name=${paragraph%</a></td><td class=\"author\"*} #До стринг
    name=${name#*class=\"subject\"><a href=\"} #После стринг
    name=${name#*>} #После стринг

    id=${paragraph#*issues/} #После стринг

    id=${id%</a></td><td class=\"author\"*} #До стринг
    id=${id%</a></td><td*} #До стринг
    id=${id%\">*} #До стринг

    file=`echo -n $name | sed 's/ /_/g'`
    file=`echo -n $file | sed 's/&quot;/"/g'`
    file=`echo -n $file | sed 's/://g'`

    echo -e  " \e[30;48;5;82m ${ITER}) \e[0;49m $id-$file"
    branchNames+=("$id-$file")
    ITER=$(expr $ITER + 1)
  fi
  
done

read -p "Выберите задачу   >> " tskId
# echo ${branchNames[$tskId]}

git checkout -b ${branchNames[$tskId]} master
echo -e  " \e[30;48;5;82m Переключили ветку на:  \e[0;49m${branchNames[$tskId]}"
git add .
echo -e  " \e[30;48;5;82m git add .  \e[0;49m"
git commit -m "${branchNames[$tskId]}"
echo -e  " \e[30;48;5;82m git commit  \e[0;49m"
git push --set-upstream origin ${branchNames[$tskId]}
git push

# create merge request
# complete task
# send message to QA