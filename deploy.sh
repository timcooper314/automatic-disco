#!/bin/sh
set -e

PROJECT_NAME="tc-test"
STACK_NAME="${PROJECT_NAME}-hello-world"
BUCKET_NAME="tc-test-code-packages"

echo "AWS SAM packaging..."
echo ${BUCKET_NAME}
sam package \
  --template-file ./template.yaml \
  --output-template-file packaged.yaml \
  --s3-bucket ${BUCKET_NAME} \
  --s3-prefix "${STACK_NAME}"
echo "Build exit code = $?"
test "$?" -ne 0 && exit $? || echo "Build completed successfully"

echo "AWS SAM deploying..."
sam deploy \
  --template-file packaged.yaml \
  --stack-name "${STACK_NAME}" \
  --parameter-overrides Project=${PROJECT_NAME} \
  --s3-bucket "${BUCKET_NAME}" \
  --s3-prefix "${STACK_NAME}" \
  --capabilities CAPABILITY_NAMED_IAM \
  --no-fail-on-empty-changeset \
