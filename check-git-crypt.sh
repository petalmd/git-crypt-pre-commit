#!/bin/bash

# See <https://gist.github.com/Falkor/848c82daa63710b6c132bb42029b30ef>
# Pre-commit hook to avoid accidentally adding unencrypted files with [git-crypt](https://www.agwa.name/projects/git-crypt/)

if [ -d .git-crypt ]; then
    STAGED_FILES=$(git diff --cached --name-status | awk '$1 != "D" { print $2 }' | xargs echo)
    if [ -n "${STAGED_FILES}" ]; then
        git-crypt status ${STAGED_FILES} &>/dev/null
        if [[ $? -ne 0  ]]; then
            git-crypt status -e ${STAGED_FILES}
            echo '/!\ You should have first unlocked your repository BEFORE staging the above file(s)'
            echo '/!\ Proceed now as follows:'
            echo -e "\t git unstage ${STAGED_FILES}"
            echo -e "\t git crypt unlock"
            echo -e "\t git add ${STAGED_FILES}"
            exit 1
        fi
    fi
fi