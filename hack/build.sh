#!/usr/bin/env bash

[[ -z "$DOCKER_BIN" ]] && DOCKER_BIN=docker
[[ -z "$VERSION" ]] && VERSION=$(printf "%s%s" "$(date '+%Y-%m-%d-')" "$(git rev-parse --short HEAD)")
if [[ -z "$1" && -z "$REPOSITORY" ]]; then
    echo "provide a repository name (as <registry>/<repository>) or define REPOSITORY"
    exit 1
fi

PROJ_DIR="$(git rev-parse --show-toplevel)"

TAG="${REPOSITORY}:${VERSION}"

$DOCKER_BIN build --platform linux/amd64 -t "$TAG" $PROJ_DIR
if [[ ! $? ]]; then
    echo error: build failed
    exit 1
fi

IMAGE_ID=$($DOCKER_BIN images --no-trunc --quiet $TAG)
$DOCKER_BIN push $IMAGE_ID $TAG
