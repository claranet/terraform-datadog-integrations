module "iam" {
  source = "./iam"
  aws_external_id = "${var.datadog_aws_external_id}"
}
