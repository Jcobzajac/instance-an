resource "aws_iam_role" "ec2_role" {
  name = "${var.project_name}-instance-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    project = "anonymization"
  }
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "${var.project_name}-instance-profile"
  role = "${aws_iam_role.ec2_role.name}"
}

resource "aws_iam_role_policy" "s3_policy" {
  name = "${var.project_name}-policy"
  role = "${aws_iam_role.ec2_role.id}"

  policy = "${data.template_file.s3_policy.rendered}"
}

data "template_file" "s3_policy" {
  template = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Effect": "Allow",
          "Action": [
              "s3:GetObject",
              "s3:ListBucket"
          ],
          "Resource": "arn:aws:s3:::${var.source_bucket}/*"
      },
      {
          "Effect": "Allow",
          "Action": "s3:PutObject",
          "Resource": "arn:aws:s3:::${var.destination_bucket}/*"
      }
  ]
}
EOF
}