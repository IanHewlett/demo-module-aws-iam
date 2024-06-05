resource "aws_iam_policy" "platform_routing_policy" {
  name = "platform-routing-policy"
  path = "/"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
          "globalaccelerator:*"
        ],
        "Effect" : "Allow",
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "ec2:CreateNetworkInterface",
          "ec2:DescribeAddresses",
          "ec2:DescribeNetworkInterfaces",
          "ec2:DescribeInstances",
          "ec2:DescribeInternetGateways",
          "ec2:DescribeSubnets",
          "ec2:DescribeRegions",
          "ec2:ModifyNetworkInterfaceAttribute",
          "ec2:DeleteNetworkInterface"
        ],
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "ec2:DeleteSecurityGroup",
          "ec2:AssignIpv6Addresses",
          "ec2:UnassignIpv6Addresses"
        ],
        "Resource" : "*",
        "Condition" : {
          "StringEquals" : {
            "ec2:ResourceTag/AWSServiceName" : "GlobalAccelerator"
          }
        }
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "ec2:CreateSecurityGroup",
          "ec2:DescribeSecurityGroups"
        ],
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "elasticloadbalancing:DescribeLoadBalancers",
          "elasticloadbalancing:DescribeLoadBalancerAttributes",
          "elasticloadbalancing:DescribeListeners",
          "elasticloadbalancing:DescribeTargetGroups",
          "elasticloadbalancing:DescribeTags"
        ],
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : "ec2:CreateTags",
        "Resource" : [
          "arn:aws:ec2:*:*:security-group/*",
          "arn:aws:ec2:*:*:network-interface/*"
        ]
      },
      {
        "Action" : [
          "route53:CreateHostedZone",
          "route53:UpdateHostedZoneComment",
          "route53:GetHostedZone",
          "route53:ListHostedZones",
          "route53:DeleteHostedZone",
          "route53:ChangeResourceRecordSets",
          "route53:ListResourceRecordSets",
          "route53:GetHostedZoneCount",
          "route53:ListHostedZonesByName",
          "route53:GetChange",
          "route53:ListTagsForResource",
          "route53:ChangeTagsForResource"
        ],
        "Effect" : "Allow",
        "Resource" : "*",
        "Sid" : "CreateHostedZoneAndRecordPolicy"
      },
      {
        "Action" : [
          "sts:AssumeRole",
          "sts:AssumeRoleWithSAML",
          "sts:AssumeRoleWithWebIdentity",
          "sts:GetAccessKeyInfo",
          "sts:GetSessionToken"
        ],
        "Effect" : "Allow",
        "Resource" : "*",
        "Sid" : "CreatingEKSRequiredSTSPolicy"
      }
    ]
  })
}
