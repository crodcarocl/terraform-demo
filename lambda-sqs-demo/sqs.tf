resource "aws_sqs_queue" "main_queue" {
    name = "mymain_queue"
    delay_seconds = 30
    max_message_size = 262144
    message_retention_seconds = 86400
    receive_wait_time_seconds = 10
    redrive_policy = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.dlq_queue.arn}\",\"maxReceiveCount\":4}"
}

resource "aws_sqs_queue" "dlq_queue" {
    name = "mydlq_queue"
    delay_seconds = 30
    max_message_size = 262144
}