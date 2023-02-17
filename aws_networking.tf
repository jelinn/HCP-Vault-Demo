resource "aws_ec2_transit_gateway" "example" {
    description = "Transit gateway to connect to HCP Vault HVN"
}

resource "aws_ram_resource_share" "example" {
  name                      = "example-resource-share"
  allow_external_principals = true
}

resource "aws_ram_principal_association" "example" {
  resource_share_arn = aws_ram_resource_share.example.arn
  principal          = hcp_hvn.primary_cluster_hvn.provider_account_id
}

resource "aws_ram_resource_association" "example" {
  resource_share_arn = aws_ram_resource_share.example.arn
  resource_arn       = aws_ec2_transit_gateway.example.arn
}

resource "hcp_aws_transit_gateway_attachment" "example" {
  depends_on = [
    aws_ram_principal_association.example,
    aws_ram_resource_association.example,
  ]

  hvn_id                        = hcp_hvn.primary_cluster_hvn.hvn_id
  transit_gateway_attachment_id = "hcp-tgw-attachment"
  transit_gateway_id            = aws_ec2_transit_gateway.example.id
  resource_share_arn            = aws_ram_resource_share.example.arn
}

resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "example" {
  transit_gateway_attachment_id = hcp_aws_transit_gateway_attachment.example.provider_transit_gateway_attachment_id
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.example.id
  cidr_block = var.vpc_cidr
  availability_zone = var.az
}

resource "aws_ec2_transit_gateway_vpc_attachment" "example" {
  subnet_ids         = [aws_subnet.my_subnet.id]
  transit_gateway_id = aws_ec2_transit_gateway.example.id
  vpc_id             = aws_vpc.example.id
  depends_on = [ 
    aws_ec2_transit_gateway.example, 
  ]
}



# resource "aws_customer_gateway" "main" {
#   bgp_asn    = 65000
#   ip_address = ""
#   type       = "ipsec.1"

#   tags = {
#     Name = "main-customer-gateway"
#   }
#}