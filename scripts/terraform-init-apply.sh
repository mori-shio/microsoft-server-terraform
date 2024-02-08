#!/bin/bash

echo "Running Terraform init..."
docker-compose run --rm terraform init
echo ""

echo "Running Terraform apply..."
docker-compose run --rm terraform apply -auto-approve
