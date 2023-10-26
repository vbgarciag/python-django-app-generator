#!/bin/bash

# Check if the correct number of command-line arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: generate_project.sh <project_name>"
    exit 1
fi

project_name="$1"

# Generate your project files using the provided project_name
project_directory="/app/$project_name"
mkdir -p "$project_directory"

cp -r /app/dockerfiles/* "$project_directory"

# Rest of your script for generating the project files
# ...
cd "$project_directory"

python -m venv venv

source venv/bin/activate

pip install django

django-admin startproject "$project_name"_project .

pip freeze > requirements.txt

echo "Project generated at: $project_directory"
