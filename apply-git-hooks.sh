#!/bin/bash

HOOK_FILE="commit-msg"
SOURCE_DIR=".githooks"

# overim ci hook_file aj source dir existuju
if [! -f "$SOURCE_DIR/$HOOK_FILE"]; then
    echo "Hook file $SOURCE_DIR/$HOOK_FILE does not exist."
    exit 1
fi

# iterujem cez vsetky workspace v priecinku

for dir in */; do
    # skontrolujem ci dir je git repo
    if [ -d "$dir/.git" ]; then
        echo "applying git hook to $dir"
        cp "$SOURCE_DIR/$HOOK_FILE" "$dir/.git/hooks/"
        # nastavim executable
        chmod +x "$dir/.git/hooks/$HOOK_FILE"
    else
        echo "$dir is not a Git repository"
    fi
done


echo "Hooks applied to all Git repositories"