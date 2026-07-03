resource "aws_iam_user" "github_actions_deploy" {
  name = "cambeezy-com-github-actions-deploy"
}

data "aws_iam_policy_document" "github_actions_deploy" {
  statement {
    sid       = "ListBucket"
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.site.arn]
  }

  statement {
    sid       = "ObjectReadWrite"
    effect    = "Allow"
    actions   = ["s3:PutObject", "s3:DeleteObject"]
    resources = ["${aws_s3_bucket.site.arn}/*"]
  }
}

resource "aws_iam_policy" "github_actions_deploy" {
  name   = "cambeezy-com-github-actions-deploy"
  policy = data.aws_iam_policy_document.github_actions_deploy.json
}

resource "aws_iam_user_policy_attachment" "github_actions_deploy" {
  user       = aws_iam_user.github_actions_deploy.name
  policy_arn = aws_iam_policy.github_actions_deploy.arn
}

# Deliberately no aws_iam_access_key resource here: long-lived key
# material would end up in Terraform state. The access key is created
# out-of-band via the AWS CLI and stored directly as GitHub secrets.
