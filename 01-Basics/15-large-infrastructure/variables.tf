variable region {
  type = string
  default = "us-west-1"
}
#
# variable ami_id {
#   type = map
#   default = {
#     "us-west-1" = "ami-018d291ca9ffc002f"
#     "us-east-2" = "ami-0568773882d492fc8"
#     "ap-northeast-1" = "ami-0f36dcfcc94112ea1"
#   }
# }
variable instance_type {
  type = string
  default = "t2.micro"
}

variable "inbound_security_group_ports" {
  type = list(number)
  description = "list of ingress ports"
  default = [22, 80, 443, 8080]
}
#
# variable "outbound_security_group_from_port" {
#   type = list(number)
#   description = "list of egress ports - 'from_port'"
#   default = [0]
# }
#
# variable "outbound_security_group_to_port" {
#   type = list(number)
#   description = "list of egress ports - 'to port'"
#   default = [65535]
# }
