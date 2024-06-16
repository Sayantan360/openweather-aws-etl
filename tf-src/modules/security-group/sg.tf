resource "aws_security_group" "openweather-etl-sg" {
  name        = "openweather-etl-sg"
  vpc_id      = module.vpc.vpc-id

  tags = {
    Name = "openweather-etl-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_inbound_traffic_ipv4" {
  security_group_id = aws_security_group.openweather-etl-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
#   cidr_ipv4         = module.vpc.aws_vpc.vpc.cidr_block
#   from_port         = 443
#   ip_protocol       = "tcp"
#   to_port           = 443
}


resource "aws_vpc_security_group_egress_rule" "allow_all_outbound_traffic_ipv4" {
  security_group_id = aws_security_group.openweather-etl-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
