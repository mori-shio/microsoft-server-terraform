#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'

echo -e "${RED}Terraformで作成したリソースを全て削除しますか？ [yes/no] ${NC}"
read -r answer

answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

if [[ "$answer" == "yes" ]]; then
    docker-compose run --rm terraform destroy -auto-approve
else
    echo "Destroy operation cancelled."
fi
