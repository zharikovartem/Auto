#!/bin/bash
clear
# Получаем JSON и инфой по задаче
# curl -s -v -H "Content-Type: text/html" -X GET -u a.zharikov@krios.by:gfhjkm4501 https://redmine.smartdesign.by/issues/30182.json

# Получить список задач в json:
# curl -s -v -H "Content-Type: text/html" -X GET -u a.zharikov@krios.by:gfhjkm4501 https://redmine.smartdesign.by/issues.json

# curl -s -v -H "Content-Type: application/json" -d '{
#     "issue": {
#         "status":{"status_id":2},
#     }
#     }'  -X GET -u a.zharikov@krios.by:gfhjkm4501 https://redmine.smartdesign.by/issues/30182



# curl -s -x '' -u a.zharikov@krios.by https://redmine.smartdesign.by/issues/30182 | jq .
# Enter host password for user 'admin':
# {
#   "issue": {
#     "status":{"name":"done","id":21}, 
#   }
# }

# curl -v -H "Content-Type: application/json" -X PUT -d '{"issue": {"notes": "Это заметка, добавленная через API"}}' -u a.zharikov@krios.by:gfhjkm4501 https://redmine.smartdesign.by/issues/30182.json




# paragraphs=()
# while read line
# do
#     echo "1"
#     paragraphs+=("$line")
# done < <(curl -s -v -H "Content-Type: text/html" -X GET -u a.zharikov@krios.by:gfhjkm4501 https://redmine.smartdesign.by/issues.json )

# # clear

# echo $paragraphs

# datas=()

# while read line
# do
#   datas+=("$line")
# done < <(curl -s -v -H "Content-Type: text/html" -X GET -u a.zharikov@krios.by:gfhjkm4501 https://redmine.smartdesign.by/issues.json | jq -r '.issues')

# clear 

# for data in "${datas[@]}"
# do
#     echo $data

# done


# printf ${paragraphs[0]}
# echo -e  " \e[30;48;5;82m ___________________________________________________________) \e[0;49m "
# echo ${paragraphs[0]}
# echo -e  " \e[30;48;5;82m ___________________________________________________________) \e[0;49m "


# curl -s -v -H "Content-Type: text/html" -X GET -u a.zharikov@krios.by:gfhjkm4501 https://redmine.smartdesign.by/issues.json | jq -r '.issues'

# string=$(curl -s -v -H "Content-Type: text/html" -X GET -u a.zharikov@krios.by:gfhjkm4501 https://redmine.smartdesign.by/issues.json | jq -r '.issues')
# clear
# echo $string



# string=$(curl -s -v -H "Content-Type: text/html" -X GET -u a.zharikov@krios.by:gfhjkm4501 https://redmine.smartdesign.by/issues.json | jq '.')
# clear
# echo ${string.issues[]}
curl -s -v -H "Content-Type: text/html" -X GET -u a.zharikov@krios.by:gfhjkm4501 https://redmine.smartdesign.by/issues.json > ernst.json
clear
json=$(cat ernst.json | jq '.issues' )

total_count=$(cat ernst.json | jq '.total_count')
echo $total_count
# json=$(cat ernst.json | jq '.' )
# echo ${json[0]}
# echo -e  " \e[30;48;5;82m ___________________________________________________________) \e[0;49m "
# echo ${json[1]}
# ${branchNames[$tskId]}
# ITER=0
# for issue in "${json[@]}"
# do
#     cat ernst.json | jq '.terms[${ITER}] .start'
#     echo -e  " \e[30;48;5;82m ___________________________________________________________ \e[0;49m "
#     ITER=$(expr $ITER + 1)
# done

cat ernst.json | jq '.issues[0]'
# echo -e  " \e[30;48;5;82m ___________________________________________________________ \e[0;49m "
# cat ernst.json | jq '.issues[1]'
# echo -e  " \e[30;48;5;82m ___________________________________________________________ \e[0;49m "
# cat ernst.json | jq '.issues[999]'




# json=$(jq -n "$string")
# clear
# # echo $json
# for issue in "${json[@]}"
# do
#     echo $issue
#     echo -e  " \e[30;48;5;82m ___________________________________________________________) \e[0;49m "
# done

# json=$(jq -n "$string" | to_entries | .[] | .key + "=" + (.value | @sh)')
# echo $json

