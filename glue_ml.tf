# Repository: aws-glue-resources-2
# File: glue_ml_infer.tf

resource "aws_glue_job" "heavy_ml_micro_worker_job" {
  name              = "heavy-ml-micro-worker-job"
  role_arn          = "arn:aws:iam::123456789012:role/AWSGlueServiceRole"
  glue_version      = "4.0"
  worker_type       = "G.025X"
  number_of_workers = 2
  timeout           = 30

  command {
    name            = "glueetl"
    script_location = "s3://company-glue-scripts/ml_infer.py"
    python_version  = "3"
  }

  default_arguments = {
    "--job-language"              = "python"
    "--additional-python-modules" = "torch,tensorflow"
  }
}
