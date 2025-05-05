# ...existing code...
while inotifywait -r -e modify,create,delete,close_write .; do
    git add .
    COMMIT_MSG="Auto-commit: $(date)"
    git diff --cached --quiet || git commit -m "$COMMIT_MSG"
    git push
    sleep 1
done
# ...existing code...