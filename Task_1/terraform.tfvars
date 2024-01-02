aws_region = "us-west-2" # Change to your preferred region
subnet_configs = [
    { cidr_block = "10.0.1.0/24", availability_zone = "us-west-2a", public = true },
    { cidr_block = "10.0.2.0/24", availability_zone = "us-west-2b", public = true },
    { cidr_block = "10.0.3.0/24", availability_zone = "us-west-2a", public = false },
    { cidr_block = "10.0.4.0/24", availability_zone = "us-west-2b", public = false },
  ]