variable "computer" {
  default = "localhost"
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
}