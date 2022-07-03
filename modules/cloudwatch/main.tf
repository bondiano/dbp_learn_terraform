resource "aws_cloudwatch_log_group" "log_group" {
  name              = "${var.name}-${var.environment}"
  retention_in_days = var.retention_in_days

  tags = {
    Environment = var.environment
    Application = var.name
  }
}
