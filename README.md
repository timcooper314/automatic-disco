# automatic-disco
master:
![master](https://codebuild.ap-southeast-2.amazonaws.com/badges?uuid=eyJlbmNyeXB0ZWREYXRhIjoiQVZhTTJDYW54VmFReWFGWDltTUszdU11NXNHRUhyN2xuR0xpSWF6SEhNeExKWTF0MTd2Rk9UTVhtZWR3cUs5QkVjVWpsWGF4KzlDQTgzV3BHcEdxNW9zPSIsIml2UGFyYW1ldGVyU3BlYyI6IjNpaDJ5V204SlpvRGdEd0QiLCJtYXRlcmlhbFNldFNlcmlhbCI6MX0%3D&branch=master)

A minimal repository setup for using GitHub actions to trigger an AWS CodeBuild job, to deploy AWS resources via CloudFormation and AWS SAM.

###  Requirements:
- AWS CLI installed and configured.
- Add GitHub secrets `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` to your repository settings.
- `GITHUB_REPO_URL` and `GITHUB_OAUTH_TOKEN` in a (gitignored) file `codebuild/github.config`.
### Setup:
- Deploy the CodeBuild project defined in codebuild.yaml, by running `./deploy.sh` (change the script variables as necessary).
- Change the `project-name` in `.github/workflows/build.yaml` to match the name of the CodeBuild project deployed.
- Copy the badge URL from the CodeBuild project in the AWS console, and paste into the repository README.
- `buildspec.yaml` is used by the CodeBuild project, to call the deploy script.
- `deploy.sh` uses aws-sam to deploy your CloudFormation template.
- `template.yaml` specifies the AWS resources to be deployed.
