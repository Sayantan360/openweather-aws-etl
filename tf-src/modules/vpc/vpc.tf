resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"

   tags = {
    Name = "openweather-etl-cloud"
  }
}

resource "aws_subnet" "private-subnet1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.0.0/20"

  tags = {
    Name = "private-subnet1"
  }
}

resource "aws_subnet" "private-subnet2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.16.0/20"

  tags = {
    Name = "private-subnet2"
  }
}

resource "aws_subnet" "public-subnet1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.32.0/20"

  tags = {
    Name = "public-subnet1"
  }
}

resource "aws_subnet" "public-subnet2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.48.0/20"

  tags = {
    Name = "public-subnet2"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "internet-gw"
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "pb-rt1" {
  subnet_id      = aws_subnet.public-subnet1.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "pb-rt2" {
  subnet_id      = aws_subnet.public-subnet2.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.vpc.id
  service_name = "com.amazonaws.us-east-1.s3"
}

# resource "aws_vpc_endpoint_route_table_association" "private-rt-s3-vpce" {
#   route_table_id  = aws_route_table.example.id
#   vpc_endpoint_id = aws_vpc_endpoint.s3.id
# }