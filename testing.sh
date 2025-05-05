#!/bin/bash

# Watch for changes in the current directory
while inotifywait -r -e modify,create,delete .; do
    git add .
    COMMIT_MSG="Auto-commit: $(date)"
    git diff --cached --quiet || git commit -m "$COMMIT_MSG"
    git push
    sleep 1
done