#!/bin/bash

echo "params: ${1}"

# get all issues
# curl -s -v -H "Content-Type: text/html" -X GET -u a.zharikov@krios.by:gfhjkm4501 https://redmine.smartdesign.by/issues.json?assigned_to_id=me > issues.json

url="https://redmine.smartdesign.by/issues.json?offset=0\&limit=100\&assigned_to_id=me\&sort=project:desc"

curl -s -v -H "Content-Type: text/html" -X GET -u a.zharikov@krios.by:gfhjkm4501 https://redmine.smartdesign.by/issues.json?offset=0\&limit=100\&assigned_to_id=me\&project_id=491\&sort=priority:desc > issues.json
clear

issuesJson=$(cat issues.json | jq ".issues" )
issues=()
total_count=$(cat issues.json | jq ".limit")
for (( i=0; i<${total_count}; i++ ));
do
    item=$(cat issues.json | jq ".issues[${i}]")
    if [[ $item != null ]]
    then
        issues[$i]=$item
    fi

done

for (( i=0; i<${#issues[@]}; i++ ));
do
    subject=$(cat issues.json | jq ".issues[${i}].subject" )
    # statusId=$(cat issues.json | jq ".issues[${i}].status.id" )
    statusName=$(cat issues.json | jq ".issues[${i}].status.name" )
    # projectId=$(cat issues.json | jq ".issues[${i}].project.id" )
    # projectName=$(cat issues.json | jq ".issues[${i}].project.name" )
    # assignedName=$(cat issues.json | jq ".issues[${i}].assigned_to.name" )
    # assignedId=$(cat issues.json | jq ".issues[${i}].assigned_to.id" )
    id=$(cat issues.json | jq ".issues[${i}].id" )
    done_ratio=$(cat issues.json | jq ".issues[${i}].done_ratio" )
    priorityName=$(cat issues.json | jq ".issues[${i}].priority.name" )
    # priorityId=$(cat issues.json | jq ".issues[${i}].priority.id" )
    # estimated_hours=$(cat issues.json | jq ".issues[${i}].estimated_hours" )

    echo -e "\e[30;48;5;82m ${i})\e[0;49m|${priorityName}|  ${statusName}: ${done_ratio}% | ${id}-${subject}    >>> https://redmine.smartdesign.by/issues/${id}" 

    # if [[ $statusName != "Done" ]]
    # then
    #     echo "${i})|${priorityName}| ${id}-${subject} |  ${statusName}: ${done_ratio}%" 
    # fi
    
done

read -p "Выберите задачу   >> " tskId

statusName=$(cat issues.json | jq ".issues[${tskId}].status.name" )
statusId=$(cat issues.json | jq ".issues[${tskId}].status.id" )
done_ratio=$(cat issues.json | jq ".issues[${tskId}].done_ratio" )
estimated_hours=$(cat issues.json | jq ".issues[${tskId}].estimated_hours" )
id=$(cat issues.json | jq ".issues[${tskId}].id" )

read -p "Обновить task в Redmine? y/n   >> " isUpdateTask
if [[ $isUpdateTask == "y" ]]
then
    read -p "Обновить статус задачи? y/n   >> " isUpdateStatus
    if [[ $isUpdateStatus == "y" ]]
    then
        echo -e  "(Текуший статус: ${statusName}) \e[30;48;5;82m Список доступных статусов:  \e[0;49m"
        echo "1) New"
        echo "2) In Progress"
        echo "3) Blocked="
        echo "4) Released"
        echo "5) Closed"
        echo "6) Canceled"
        echo "7) In Queue"
        echo "8) Done"
        echo "9) Acceptance"

        read -p "Выберите статус   >> " selectedStatus
        statusId=$selectedStatus
    fi

    read -p "Обновить готовность задачи? y/n   >> " isUpdateDoneRatio
    if [[ $isUpdateDoneRatio == "y" ]]
    then
        echo -e  "(Текушая готовность: ${done_ratio})%"
        
        read -p "Укажите готовность в %   >> " selectedDoneRatio
        done_ratio=$selectedDoneRatio
    fi

    read -p "Обновить затраченное время? y/n   >> " isUpdateEstimated
    if [[ $isUpdateEstimated == "y" ]]
    then
        echo -e  "(Текушее затраченное время: ${estimated_hours}) \e[30;48;5;82m Список доступных статусов:  \e[0;49m"
        
        read -p "Укажите затраченное время (4.0 - пример)  >> " estimated
        estimated_hours=$estimated
    fi
fi

if [[ $isUpdateTask == "y" ]]
then
    # savedJson='{"issue": {"notes": "Это заметка, добавленная через API", "status": {"id":${statusId}},"estimated_hours": ${estimated_hours}, "done_ratio": ${done_ratio}}}'
    # savedJson='{"issue": {"notes": "Это заметка, добавленная через API", "status": {"id":${statusId}},"estimated_hours": ${estimated_hours}, "done_ratio": ${done_ratio}}}'
    savedJson="{\"issue\": {\"notes\": \"Это заметка, добавленная через API\", \"status_id\": ${statusId}}}"

    
    echo -e  " \e[30;48;5;82m savedJson:  \e[0;49m"
    echo $savedJson
    echo -e  " \e[30;48;5;82m Рабочий запрос на Обнавление задачи  \e[0;49m"
    curl -v -H "Content-Type: application/json" -X PUT -d "${savedJson}" -u a.zharikov@krios.by:gfhjkm4501 https://redmine.smartdesign.by/issues/${id}.json
    # curl -v -H "Content-Type: application/json" -X PUT -d '{"issue": {"notes": "Это заметка, добавленная через API", "status": {"id":${statusId}},"estimated_hours": ${estimated_hours}, "done_ratio": ${done_ratio}}}' -u a.zharikov@krios.by:gfhjkm4501 https://redmine.smartdesign.by/issues/${id}.json
  # curl -v -H "Content-Type: application/json" -X PUT -d '{"issue": {"notes": "Это заметка, добавленная через API"}}' -u a.zharikov@krios.by:gfhjkm4501 https://redmine.smartdesign.by/issues/30182.json
  
fi
