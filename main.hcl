variable "computer" {
  default = "localhost"
  description = "The name of the computer that it will welcome"
}

module "dependency" {
  source = "jumppad-labs/test-module"
  version = "0.1.0"
}

resource "template" "motd" {
  source = <<-EOF
  Welcome to ${variable.computer}!
  EOF
  destination = "${data("template")}/motd"
}

output "motd" {
  value = resource.template.motd.destination
  description = "The path to the message of the day file"
}