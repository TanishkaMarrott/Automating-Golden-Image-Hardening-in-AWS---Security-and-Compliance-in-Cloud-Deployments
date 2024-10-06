provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_iam_role" "image_builder_role" {
  name = "ec2-image-builder-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "image_builder_attach" {
  name       = "image-builder-policy-attach"
  roles      = [aws_iam_role.image_builder_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_imagebuilder_image_recipe" "example" {
  name       = "secure-golden-image"
  version    = "1.0.0"
  
  # Parent AMI for the image
  parent_image = "arn:aws:imagebuilder:ap-northeast-1:aws:image/amazon-linux-2-x86/2023"

  # Define components
  component {
    component_arn = "arn:aws:imagebuilder:ap-northeast-1:aws:component/amazon-linux-2-hardening/1.0.0/1"
  }

  component {
    component_arn = "arn:aws:imagebuilder:ap-northeast-1:aws:component/patch-linux-base/1.0.0/1"
  }

  block_device_mapping {
    device_name = "/dev/xvda"
    ebs {
      delete_on_termination = true
      volume_size           = 30
      volume_type           = "gp2"
    }
  }

  tags = {
    Name = "SecureGoldenImage"
  }
}


resource "aws_imagebuilder_image_pipeline" "secure_pipeline" {
  name             = "secure-golden-image-pipeline"
  image_recipe_arn = aws_imagebuilder_image_recipe.example.arn
  infrastructure_configuration_arn = aws_imagebuilder_infrastructure_configuration.example.arn
  schedule {
    schedule_expression = "cron(0 0 * * ? *)"
  }
}

resource "aws_imagebuilder_infrastructure_configuration" "example" {
  name       = "secure-infra-config"
  instance_profile_name = aws_iam_instance_profile.example.name
}
