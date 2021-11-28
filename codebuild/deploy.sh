#!/bin/sh

PROJECT="tc-test-gh-actions"
BUCKET_NAME="tc-test-code-packages"
REGION="ap-southeast-2"

# Source github config global variables
source ./github.config

STACK_OVERRIDES="\
  GitHubOAuthToken=${GITHUB_OAUTH_TOKEN} \
  GitHubRepoUrl=${GITHUB_REPO_URL} \
"

aws cloudformation deploy \
  --template-file codebuild.yaml \
  --stack-name "${PROJECT}" \
  --parameter-overrides Project=${PROJECT} ${STACK_OVERRIDES} \
  --capabilities CAPABILITY_NAMED_IAM \
  --no-fail-on-empty-changeset
