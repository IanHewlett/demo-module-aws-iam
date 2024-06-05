module "aws_iam_iam" {
  source = "./modules/iam"

  aws_account_id = var.aws_account_id
}

module "aws_iam_vpc" {
  source = "./modules/vpc"

  aws_account_id = var.aws_account_id
}

module "aws_iam_eks" {
  source = "./modules/eks"

  aws_account_id = var.aws_account_id
}

module "aws_iam_routing" {
  source = "./modules/routing"

  aws_account_id = var.aws_account_id
}
