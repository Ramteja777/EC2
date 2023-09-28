variable "instance_count" {
  description = "Number of instances to create"
  type        = number
  default     = 3  # Set a default value or change as needed
}


variable "os-name" {
  default = "ami-053b0d53c279acc90"
}

variable "instance-type" {
  default = "t2.small"
}

variable "key" {
  default = "ram-master-key"
}
