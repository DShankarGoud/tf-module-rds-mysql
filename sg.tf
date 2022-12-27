resource "aws_db_security_group" "main" {
  name = "${var.COMPONENT}-${var.ENV}"

  ingress {
    cidr = data.terraform_remote_state.vpc.outputs.VPC_CIDR
  }
}

data "aws_secretsmanager_secret" "secret" {
  name = "roboshop"
}

data "aws_secretsmanager_secret_version" "secret" {
  secret_id = data.aws_secretsmanager_secret.secret.id
}
