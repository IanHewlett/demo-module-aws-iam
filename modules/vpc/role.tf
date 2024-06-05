module "platform_aws_vpc_role" {
  source      = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version     = "~> 5.17.0"
  create_role = true

  role_name                         = "platform-vpc-role"
  role_path                         = "/"
  role_requires_mfa                 = false
  custom_role_policy_arns           = [aws_iam_policy.platform_vpc_policy.arn]
  number_of_custom_role_policy_arns = 1

  trusted_role_arns = ["arn:aws:iam::${var.aws_account_id}:root", "arn:aws:iam::${var.aws_account_id}:role/Terraform"]
}
