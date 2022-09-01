## What it does?

It basically integrates lambda with sqs as a trigger to save the content of the message in an s3 bucket.

## Install

You must have AWS CLI previously set up.

Using terraform on your CLI:

    terraform init
    terraform apply

## Executing

Using AWS CLI:

    aws sqs send-message --queue-url ${queue_url} --message-body '{\"Name\": \"MyAwesomeName\", \"Kind\": \"Test\"}'

## Diagram
```mermaid
graph LR
A[User] -- Sends Message 'JSON' --> B((SQS))
B --> D{LambdaFunction}
D -- SavesMessage --> C{S3 Bucket}