locals {
  ec2_name_1 = "AWS-SMB-Training_servers"
}

module "ec2_instance_1" {

  source = "github.com/dkumar-p/terraform-aws-ec2-instance.git"

  name = local.ec2_name_1

  ami                         = var.ami_master
  instance_type               = var.instance_type_1
  key_name                    = "pavan-test-keypair"
  monitoring                  = false
  iam_instance_profile        = "AmazonSSMRoleForInstancesQuickSetup"
  vpc_security_group_ids      = [module.security_group_ec2.security_group_id]
  subnet_id                   = element(module.vpc.public_subnets, 0)
  private_ip                  = "10.0.0.14"
  associate_public_ip_address = true

  enable_volume_tags = false
  root_block_device = [
    {
      encrypted             = true
      volume_type           = "gp3"
      volume_size           = 40
      delete_on_termination = true
      tags = merge(var.tags,
        {
          "Name" = local.ec2_name_1
        },
      )
    },
  ]

  user_data = file("script.sh")


  tags = merge(var.tags,
    {
      "Name" = local.ec2_name_1
    }
  )
}


/*
resource "aws_volume_attachment" "this" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.this.id
  instance_id = module.ec2_instance_1.id
}

resource "aws_ebs_volume" "this" {
  availability_zone = "ap-south-1a"
  iops = "1000"
  type = "gp2"
  size              = 10
}
*/

module "ec2_instance_2" {

  source = "github.com/dkumar-p/terraform-aws-ec2-instance.git"

  name = local.ec2_name_1

  ami                         = var.ami_master
  instance_type               = var.instance_type_1
  key_name                    = "pavan-test-keypair"
  monitoring                  = false
  iam_instance_profile        = "AmazonSSMRoleForInstancesQuickSetup"
  vpc_security_group_ids      = [module.security_group_ec2.security_group_id]
  subnet_id                   = element(module.vpc.public_subnets, 0)
  private_ip                  = "10.0.0.17"
  associate_public_ip_address = true

  enable_volume_tags = false
  root_block_device = [
    {
      encrypted             = true
      volume_type           = "gp3"
      volume_size           = 40
      delete_on_termination = true
      tags = merge(var.tags,
        {
          "Name" = local.ec2_name_1
        },
      )
    },
  ]

  user_data = file("script.sh")


  tags = merge(var.tags,
    {
      "Name" = local.ec2_name_1
    }
  )
}


/*
resource "aws_volume_attachment" "this" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.this.id
  instance_id = module.ec2_instance_1.id
}

resource "aws_ebs_volume" "this" {
  availability_zone = "ap-south-1a"
  iops = "1000"
  type = "gp2"
  size              = 10
}
*/


