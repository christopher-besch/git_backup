#!/bin/bash

set -euo pipefail
IFS=$' \n\t'
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

ALL_REPOS_PATH="$DIR/all_repos.txt"

# @param $1 remote address
#   e.g. github.com@christopher-besch/docker_git_backup
clone_repo() {
    CLONE_REMOTE="git@$1.git"
    CLONE_TARGET="$DIR/repos/$1"

    echo "cloning $CLONE_REMOTE into $CLONE_TARGET"

    rm -vrf "$CLONE_TARGET"
    mkdir -vp "$CLONE_TARGET"

    if git clone "$CLONE_REMOTE" "$CLONE_TARGET" --recurse; then
        echo "Cloned $CLONE_REMOTE"
    else
        echo "Error: failed to clone $CLONE_REMOTE"
        exit 1
    fi
}

main() {
    while IFS="" read -r CUR_DIR; do
        echo $CUR_DIR
        # only lines with content
        if [ -n "$CUR_DIR" ]; then
            clone_repo $CUR_DIR
        fi
    done < "$ALL_REPOS_PATH"
}

main
