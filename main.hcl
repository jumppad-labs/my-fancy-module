variable "computer" {
  default = "localhost"
}

resource "template" "motd" {
  data = <<-EOF
  Welcome to ${variable.computer}!
  EOF
  destination = "${data("template")}/motd"
}

output "motd" {
  value = template.motd.destination
}