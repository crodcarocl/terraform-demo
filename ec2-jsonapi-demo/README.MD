## Status

Work in progress

## What it does?

It basically creates a VPC and an EC2 depending on the workspace that you are using. It also deploys a small API on the EC2.

## Considerations

Please make sure that your workspace name is one of these:

* DEV
* QA
* STAGE
* PROD

## Install

You must have AWS CLI previously set up.

Using terraform on your CLI:

    terraform init
    terraform apply

## Executing

Test the API in your browser using the public DNS.

## Diagram
```mermaid
graph LR
A[User] -- Sends HTTP request --> B((ALB))
B --> c((TG))
c --> D{EC2}
D -- Receives HTTP request --> E{API}