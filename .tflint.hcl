config {
  call_module_type = "all"
  force = false
  disabled_by_default = false
}

plugin "terraform" {
    enabled = true
  preset  = "all"
    version = "0.4.0"
    source  = "github.com/terraform-linters/tflint-ruleset-terraform"
}
