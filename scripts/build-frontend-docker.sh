#!/bin/bash
docker_username_lower=$(echo "$docker_username" | tr '[:upper:]' '[:lower:]')
[[ -z "${GIT_COMMIT}" ]] && Tag='local' || Tag="${GIT_COMMIT::8}"
[[ -z "${docker_username}" ]] && DockerRepo='' || DockerRepo="ghcr.io/${docker_username_lower}/"
cd ..
docker build -t "${DockerRepo}frontend-fortune-app:latest" -t "${DockerRepo}frontend-fortune-app:1.0-$Tag" frontend/