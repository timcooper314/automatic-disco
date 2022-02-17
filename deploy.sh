#!/bin/sh
set -e

PROJECT_NAME="tc-test"
STACK_NAME="${PROJECT_NAME}-hello-world"
BUCKET_NAME="tc-test-code-packages"

echo ${BUCKET_NAME}

echo "AWS SAM deploying..."
sam deploy \
  --template-file ./template.yaml \
  --stack-name "${STACK_NAME}" \
  --parameter-overrides Project=${PROJECT_NAME} \
  --s3-bucket "${BUCKET_NAME}" \
  --s3-prefix "${STACK_NAME}" \
  --capabilities CAPABILITY_NAMED_IAM \
  --no-fail-on-empty-changeset

echo "Deploy exit code = $?"
test "$?" -ne 0 && exit $? || echo "Deploy completed successfully"
