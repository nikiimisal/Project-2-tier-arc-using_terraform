

variable "region" {
  default = "eu-north-1"
}

variable "avaliblity-zone-1" {
  default = "eu-north-1a"
}

variable "avaliblity-zone-2" {
  default = "eu-north-1b"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "private_cidr" {
  default = "10.0.0.0/20"
}

variable "public_cidr" {
  default = "10.0.16.0/20"
}


variable "project_name" {
  default = "FCT"
}

variable "igw_cidr" {
  default = "0.0.0.0/0"
}

variable "ami" {
  default = "ami-0b46816ffa1234887"
}

variable "instance_typ" {
  default = "t3.micro"
}

variable "key" {
  default = "server1"
}



