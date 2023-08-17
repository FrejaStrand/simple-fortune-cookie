#!/bin/bash
docker_username_lower=$(echo "$docker_username" | tr '[:upper:]' '[:lower:]')
echo "$docker_password" | docker login ghcr.io --username "$docker_username_lower" --password-stdin
docker push "ghcr.io/$docker_username_lower/backend-fortune-app:1.0-${GIT_COMMIT::8}"
docker push "ghcr.io/$docker_username_lower/backend-fortune-app:latest" &
wait