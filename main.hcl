variable "computer" {
  default = "localhost"
}

module "dependency" {
  source = "github.com/jumppad-labs/test-module"
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