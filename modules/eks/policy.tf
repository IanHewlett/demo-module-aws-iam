resource "aws_iam_policy" "platform_eks_policy" {
  name = "platform-eks-policy"
  path = "/"

  policy = jsonencode({
    Statement = [
      {
        Action = [
          "ec2:AuthorizeSecurityGroupEgress",
          "ec2:AuthorizeSecurityGroupIngress",
          "ec2:CreateLaunchTemplate",
          "ec2:CreateSecurityGroup",
          "ec2:RevokeClientVpnIngress",
          "ec2:RevokeSecurityGroupEgress",
          "ec2:RevokeSecurityGroupIngress",
          "ec2:RunInstances",
          "ec2:Describe*",
          "ec2:CreateSecurityGroup",
          "ec2:DeleteSecurityGroup",
          "ec2:CreateTags",
          "ec2:DeleteTags",
          "ec2:DescribeTags",
          "ec2:ModifySecurityGroupRules",
          "ec2:CreateLaunchTemplateVersion",
          "ec2:DeleteLaunchTemplate",
          "ec2:DeleteLaunchTemplateVersions",
          "ec2:DescribeLaunchTemplateVersions",
          "ec2:DescribeLaunchTemplates",
          "ec2:GetLaunchTemplateData",
          "ec2:ModifyLaunchTemplate",
          "ec2:UpdateSecurityGroupRuleDescriptionsIngress",
          "ec2:UpdateSecurityGroupRuleDescriptionsEgress",
        ]
        Effect   = "Allow"
        Resource = "*"
        Sid      = "CreatingEKSRequiredEC2Policy"
      },
      {
        Action   = "kms:*"
        Effect   = "Allow"
        Resource = "*"
        Sid      = "CreatingEKSRequiredKMSPolicy"
      },
      {
        Action = [
          "autoscaling:EnableMetricsCollection",
          "autoscaling:DescribeAutoScalingGroups",
        ]
        Effect   = "Allow"
        Resource = "*"
        Sid      = "EnableMetricsCollection"
      },
      {
        Action   = "logs:*"
        Effect   = "Allow"
        Resource = "*"
        Sid      = "CreatingEKSRequiredCLOUDWATCHLOGPolicy"
      },
      {
        Action = [
          "sts:AssumeRole",
          "sts:AssumeRoleWithSAML",
          "sts:AssumeRoleWithWebIdentity",
          "sts:GetAccessKeyInfo",
          "sts:GetSessionToken",
        ]
        Effect   = "Allow"
        Resource = "*"
        Sid      = "CreatingEKSRequiredSTSPolicy"
      },
      {
        Action   = "eks:*"
        Effect   = "Allow"
        Resource = "*"
        Sid      = "CreatingEKSRequiredEKSPolicy"
      },
      {
        Action = [
          "iam:AddClientIDToOpenIDConnectProvider",
          "iam:AddRoleToInstanceProfile",
          "iam:AttachRolePolicy",
          "iam:CreateInstanceProfile",
          "iam:CreateOpenIDConnectProvider",
          "iam:CreatePolicy",
          "iam:CreatePolicyVersion",
          "iam:CreateRole",
          "iam:DeleteInstanceProfile",
          "iam:DeleteOpenIDConnectProvider",
          "iam:DeletePolicy",
          "iam:DeletePolicyVersion",
          "iam:DeleteRole",
          "iam:DeleteRolePolicy",
          "iam:DetachRolePolicy",
          "iam:GetInstanceProfile",
          "iam:GetOpenIDConnectProvider",
          "iam:GetPolicy",
          "iam:GetPolicyVersion",
          "iam:GetRole",
          "iam:GetRolePolicy",
          "iam:List*",
          "iam:PassRole",
          "iam:PutRolePolicy",
          "iam:RemoveClientIDFromOpenIDConnectProvider",
          "iam:RemoveRoleFromInstanceProfile",
          "iam:SetDefaultPolicyVersion",
          "iam:TagInstanceProfile",
          "iam:TagOpenIDConnectProvider",
          "iam:TagPolicy",
          "iam:TagRole",
          "iam:UntagInstanceProfile",
          "iam:UntagOpenIDConnectProvider",
          "iam:UntagPolicy",
          "iam:UntagRole",
          "iam:UpdateAssumeRolePolicy",
          "iam:UpdateOpenIDConnectProviderThumbprint",
          "iam:UpdateRole",
          "iam:UpdateRoleDescription",
          "cloudformation:ListStacks"
        ]
        Effect   = "Allow"
        Resource = "*"
        Sid      = "CreatingEKSRequiredIAMPolicy"
      },
    ]
    Version = "2012-10-17"
  })
}
