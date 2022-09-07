#!/bin/zsh
FILE_FOLDERS_LIST="folders_l.txt"

echo -n "Введите cloud-id: "
read cloud_id
yc resource-manager folder list --cloud-id $cloud_id --format json | jq ".[].id" -r &> $FILE_FOLDERS_LIST

while read folders
do
    #yc iam service-account list --folder-id=$folders | awk '{print $2, $4}' | grep $1
    yc organization-manager organization list --folder-id $folders
done < $FILE_FOLDERS_LIST
