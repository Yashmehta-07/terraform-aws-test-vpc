variable "vpc_config" {
    description = "VPC Configuration"
    type = object({
        cidr_block = string
        name = string    
    })

    validation {
        condition = can(cidrnetmask(var.vpc_config.cidr_block))
        error_message = "Invalid CIDR block - ${var.vpc_config.cidr_block}"
    }
}

variable "subnets_config" {
    description = "Subnet Configuration"
    type = map(object({
        cidr_block = string
        availability_zone = string
        public = optional(bool, false)
    }))

    validation {
        condition = alltrue([for config in var.subnets_config : can(cidrnetmask(config.cidr_block))])
        error_message = "Invalid CIDR block "
    }
  
} 