terraform {
  backend "s3" {
    bucket = "dft123"
    key = "terraform.tfstate"
    region = "eu-north-1"
  }
}

provider "aws" {
  region = var.region
}

#create a vpc
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.project_name}-vpc"   # pass the varible inside the string
  }
}

# create a private subnet

resource "aws_subnet" "private-subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.private_cidr
  availability_zone = var.avaliblity-zone-1

  tags = {
    Name = "${var.project_name}-private-subnet"
  }
}


# create a public subnet

resource "aws_subnet" "public-subnet" {
  vpc_id = aws_vpc.my_vpc.id                             # command for referance
  cidr_block = var.public_cidr
  availability_zone = var.avaliblity-zone-2
  map_public_ip_on_launch = true                       # for auto assign ip

  tags = {
    Name = "${var.project_name}-Public-subnet"
  }
}

# create a internate gateway

resource "aws_internet_gateway" "my_IGW" {
  vpc_id = aws_vpc.my_vpc.id                            # command for referance

  tags = {
    Name = "${var.project_name}_IGW"
  }
}


# create a default route table

resource "aws_default_route_table" "main_RT" {
  default_route_table_id = aws_vpc.my_vpc.default_route_table_id


  tags = {
    Name = "${var.project_name}-main-RT"
  }
}
 
 # add a route main route table 

resource "aws_route" "aws_route" {
  route_table_id = aws_default_route_table.main_RT.id
  destination_cidr_block = var.igw_cidr
  gateway_id = aws_internet_gateway.my_IGW.id      # refer inter gateway create zalyavar
}



## create a security group

resource "aws_security_group" "my_sg" {
  vpc_id = aws_vpc.my_vpc.id       # refer vpc id here
  name = "${var.project_name}-SG"
 description = "allow ssh, http, mysql traffic"

 ingress  {
  protocol ="tcp"
  to_port = 22
  from_port = 22
  cidr_blocks = ["0.0.0.0/0"]
 }

 ingress  {
  protocol ="tcp"
  to_port = 80
  from_port = 80
  cidr_blocks = ["0.0.0.0/0"]
 }

 ingress  {
  protocol ="tcp"
  to_port = 3306
  from_port = 3306
  cidr_blocks = ["0.0.0.0/0"]
 }

egress  {
    
   protocol = -1
   to_port = 0
   from_port = 0
   cidr_blocks = ["0.0.0.0/0"]
}

depends_on = [ aws_vpc.my_vpc ]       # esplicite dependency

}


# create a public server

resource "aws_instance" "public_server" {
  subnet_id = aws_subnet.public-subnet.id
  ami = var.ami
  instance_type = var.instance_typ
  key_name = var.key
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  tags = {
    Name = "${var.project_name}-app_server"
  }

  depends_on = [ aws_security_group.my_sg ]
}


# create a private server

resource "aws_instance" "private_server" {
  subnet_id = aws_subnet.private-subnet.id
  ami = var.ami
  instance_type = var.instance_typ
  key_name = var.key
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  
  
  tags = {
    Name = "${var.project_name}-db-server"
  }

  depends_on = [ aws_security_group.my_sg ]
}



