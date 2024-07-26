locals {
  csr_file          = format("output/%s/%s.csr", var.cn, var.cn)
  csr_config_file   = format("output/%s/%s.conf", var.cn, var.cn)
  key_file          = format("output/%s/%s.key", var.cn, var.cn)
  key_password_file = format("output/%s/%s.secret", var.cn, var.cn)
}
