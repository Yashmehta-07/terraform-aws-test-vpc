module "vpc"{
    source = "./module/vpc"
    vpc_config = {
        cidr_block = "10.0.0.0/16"
        name = "my-root-vpc"
    }

    subnets_config = {
        public = {
            cidr_block = "10.0.0.0/24"
            availability_zone = "us-east-1a"
            public = true

        }
        private = {
            cidr_block = "10.0.1.0/24"
            availability_zone = "us-east-1b"
        }
    }
} 