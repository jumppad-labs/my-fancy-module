variable "computer" {
  default = "localhost"
  description = "The name of the computer"
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
  description = "The path to the message of the day file"
}