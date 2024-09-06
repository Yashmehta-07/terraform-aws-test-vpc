#vpc
output "vpc_id" {
    value = aws_vpc.main.id
}

locals {
    public_subnet_output ={
        for key, config in local.public_subnets: key => {
            id = aws_subnet.main[key].id
            az = aws_subnet.main[key].availability_zone
        }
    }

    private_subnet_output = {
        for key, config in local.private_subnets: key => {
            id = aws_subnet.main[key].id
            az = aws_subnet.main[key].availability_zone
        }
    }
}

#subnets
output "public_subnets" {
    value = local.public_subnet_output
}

output "private_subnets" {
    value = local.private_subnet_output
}


#internet gateway
output "internet_gateway" {
    value = aws_internet_gateway.main
}

#route table
output "route_table" {
    value = aws_route_table.main
}

#route table association
output "route_table_association" {
    value = aws_route_table_association.main
}