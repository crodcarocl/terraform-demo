data "archive_file" "myzip" {
    type = "zip"
    source_file = "main.py"
    output_path = "main.zip"
}

resource "aws_lambda_function" "my_tf_lambdafunction" {
    filename = "main.zip"
    function_name = "mypython_lambda_test"
    role = "${aws_iam_role.mypython_lambda_role.arn}"
    handler = "main.lambda_handler"
    runtime = "python3.8"
    # Indicates the source file for lambda function so it detect change on code.
    source_code_hash = "data.archive_file.myzip.output_base64sha256"
}

resource "aws_lambda_event_source_mapping" "sqs_lambda_trigger" {
    event_source_arn = "${aws_sqs_queue.main_queue.arn}"
    enabled = true
    function_name = "${aws_lambda_function.my_tf_lambdafunction.arn}"
    batch_size = 1
}