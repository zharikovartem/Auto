#!/bin/bash
function getProjectByName {
    count=($(jq '.servers | length' data/projects.json))
    # echo $count
    for (( i=0; i<${count}; i++ ));
    do
        name=($(jq ".servers | .[${i}].name" data/projects.json))
        # userName=($(jq ".servers| .[${i}].name" data/projects.json))
        # echo "${name} == ${1}"

        # jq ".servers| .[${i}].name" data/gitUsers.json
        if [[ $name == "\"${1}\"" ]]
        then
            folder=($(jq ".servers | .[${i}].folder" data/projects.json))
            scriptsCount=($(jq ".servers | .[${i}].init.scripts | length " data/projects.json))
            # echo "scriptsCount=${scriptsCount}"

            # jq '.servers | [${i}].init.scripts[]' data/projects.json
            scripts="\"scripts\": ["

            # scriptCount=($(jq '.servers.[${i}].init.scripts | length' data/projects.json))
            for (( j=0; j<${scriptsCount}; j++));
            do
                item=($(jq ".servers | .[${i}].init.scripts | .[${j}] " data/projects.json))
                # echo "${j}) ${item//_/ }"
                # echo "${item})"
                scripts+="${item},"
                $j++
            done

            scripts+="]"

            # echo [$name, $folder]
            echo {\"name\":$name, \"folder\":$folder, $scripts}
        fi
    done
}