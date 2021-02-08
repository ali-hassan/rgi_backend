#!/usr/bin/env bash

cat > public/version.txt << EOF
{
  "commit_sha": "$COMMIT",
  "image": "nrgi/rgi-api:$BRANCH.$COMMIT"
}
EOF