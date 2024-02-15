variable "region" {
  default        = "eu-central-1"
}

variable "project_name" {
  default       = "anonymizitation"
}

variable "subnet_id" {
  default       = "subnet-092df15794226ebea"
}

variable "instance_type" {
  default       = "t2.micro"
}

variable "ami" {
  default       = "ami-03cceb19496c25679"
}

variable "security_group" {
  default       = "sg-0627ada13283e0b90"
}

variable "source_bucket" {
  default       = "source-12345"
}

variable "destination_bucket" {
  default       = "destination-123455"
}