#!/bin/sh

# Konfigurationsvariablen
REPO_OWNER=Sophies-Creative-hub
REPO_NAME=full-stack-open-pokedex
BRANCH_NAME=versioning
BASE_BRANCH=master
PR_TITLE="Ihre PR-Überschrift"
PR_BODY="Ihre PR-Beschreibung"

# Erstellen eines PRs über die GitHub API
PR_RESPONSE=$(curl -s -X POST -H "Authorization: token $GITHUB_TOKEN" -d '{
  "title": "'"${PR_TITLE}"'",
  "body": "'"${PR_BODY}"'",
  "head": "'"${BRANCH_NAME}"'",
  "base": "'"${BASE_BRANCH}"'"
}' "https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/pulls")

# PR-URL aus der API-Antwort extrahieren
PR_URL=$(echo "$PR_RESPONSE" | jq -r .html_url)

# Ausgabe der PR-URL
echo "Erstellter PR: $PR_URL"