#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# --- CONFIGURATION ---
SOURCE_USER="i4147"
TARGET_USER="i4147"

echo "===================================================="
echo " Starting GitHub Repository Transfer Script"
echo "===================================================="

# Prompt for the Personal Access Token safely
read -sp "Enter your GitHub Personal Access Token (for $SOURCE_USER): " GH_TOKEN
echo -e "\n"

if [ -z "$GH_TOKEN" ]; then
    echo "❌ Error: Token cannot be empty."
    exit 1
fi

# Define temporary file paths for cleanup
TMP_DIR=$(mktemp -d -t github-transfer-XXXXXXXXXX)
REPO_LIST_FILE="$TMP_DIR/repos.txt"

# Ensure temporary files are deleted on exit, even if aborted
cleanup() {
    echo "🧹 Cleaning up downloaded metadata and temporary files..."
    rm -rf "$TMP_DIR"
    echo "✅ Workspace is completely clean."
}
trap cleanup EXIT

echo "⏳ Fetching repository list for user '$SOURCE_USER'..."

# Fetch up to 100 repositories (handles both public and private repositories accessible by the token)
curl -s -H "Authorization: token $GH_TOKEN" \
     -H "Accept: application/vnd.github.v3+json" \
     "https://github.com" \
     | jq -r '.[].name' > "$REPO_LIST_FILE"

REPO_COUNT=$(wc -l < "$REPO_LIST_FILE" | xargs)

if [ "$REPO_COUNT" -eq 0 ]; then
    echo "⚠️ No repositories found owned by '$SOURCE_USER'."
    exit 0
fi

echo "📦 Found $REPO_COUNT repositories to transfer."
echo "----------------------------------------------------"

# Iterate over each repository and trigger the transfer endpoint
while read -r REPO_NAME; do
    if [ -z "$REPO_NAME" ]; then continue; fi
    
    echo "🚀 Initiating transfer for: $REPO_NAME -> $TARGET_USER"
    
    RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" \
         -X POST \
         -H "Authorization: token $GH_TOKEN" \
         -H "Accept: application/vnd.github.v3+json" \
         -d "{\"new_owner\":\"$TARGET_USER\"}" \
         "https://github.com")
    
    if [ "$RESPONSE" -eq 202 ]; then
        echo "✅ Transfer request accepted for '$REPO_NAME'."
    else
        echo "❌ Failed to transfer '$REPO_NAME' (HTTP Status: $RESPONSE)."
    fi
done < "$REPO_LIST_FILE"

echo "----------------------------------------------------"
echo "🎉 Script complete!"
echo "👉 Action Required: Log into your '$TARGET_USER' account to accept the incoming transfer requests."
