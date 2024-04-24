variable "computer" {
  default = "yourmachine"
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