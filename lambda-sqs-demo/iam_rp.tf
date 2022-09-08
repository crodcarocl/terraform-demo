resource "aws_iam_role" "mypython_lambda_role" {
    name = "mypython_role"
    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "lambda.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_policy" "mypython_lambda_policy" {
  name = "mypython_policy"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowSQSPermissions",
            "Effect": "Allow",
            "Resource": ["arn:aws:sqs:*:*:*"],
            "Action": [
                "sqs:ChangeMessageVisibility",
                "sqs:DeleteMessage",
                "sqs:GetQueueAttributes",
                "sqs:ReceiveMessage"
            ]
        },
        {
            "Sid": "AllowS3Permissions",
            "Effect": "Allow",
            "Resource": ["arn:aws:s3:::sqslamdbas3bucket/*"],
            "Action": [
                "s3:GetObject",
                "s3:PutObject"
            ]
        },
        {
            "Sid": "AllowInvokingLambdas",
            "Effect": "Allow",
            "Resource": ["arn:aws:lambda:*:*:function:*"],
            "Action": ["lambda:InvokeFunction"]
        },
        {
            "Sid": "AllowCreatingLogGroups",
            "Effect": "Allow",
            "Resource": ["arn:aws:logs:*:*:*"],
            "Action": ["logs:CreateLogGroup"]
        },
        {
            "Sid": "AllowWritingLogs",
            "Effect": "Allow",
            "Resource": ["arn:aws:logs:*:*:log-group:/aws/lambda/*:*"],
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ]
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "mypython_lambda_policy" {
    policy_arn = aws_iam_policy.mypython_lambda_policy.arn
    role = aws_iam_role.mypython_lambda_role.name
}