import json
import boto3

def lambda_handler(event, context):
    for k, v in event.items():
        print(k, v)

    s3 = boto3.client("s3")
    data = json.loads(event["Records"][0]["body"])
    s3.put_object(Bucket="sqslamdbas3bucket", Key="data.json", Body=json.dumps(data))
    
    return {
        'statudCode': 200,
        'body': json.dumps('Hello world!')
    }