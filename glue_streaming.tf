resource "aws_glue_job" "streaming_clickstream_job" {
  name              = "streaming-clickstream-job"
  role_arn          = "arn:aws:iam::123456789012:role/AWSGlueServiceRole"
  glue_version      = "4.0"
  worker_type       = "G.1X"
  number_of_workers = 2
  timeout           = 120

  command {
    name            = "gluestreaming"
    script_location = "s3://company-glue-scripts/clickstream.py"
    python_version  = "3"
  }

  default_arguments = {
    "--job-language"              = "python"
    "--additional-python-modules" = "awswrangler==3.6.0,boto3>=1.28.0,urllib3>=2.0.0"
  }
}
