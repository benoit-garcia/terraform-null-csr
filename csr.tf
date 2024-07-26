resource "local_file" "csr_config" {
  filename = local.csr_config_file
  content = templatefile(
    "${path.module}/csr_config.tpl",
    {
      cn           = var.cn
      country      = var.country
      location     = var.location
      organization = var.organization
      san          = join(",", var.san)
  })
}

resource "null_resource" "generate_csr" {
  provisioner "local-exec" {
    command = format("openssl req -new -sha256 -key %s -passin file:%s -config %s -out %s", local.key_file, local.key_password_file, local.csr_config_file, local.csr_file)
  }

  depends_on = [
    local_file.csr_config,
    null_resource.generate_key
  ]

  lifecycle {
    replace_triggered_by = [
      local_file.csr_config,     # recreate CSR when the configuration file.
      null_resource.generate_key # Recreate the CSR when the private key changes.
    ]
  }
}

data "local_file" "csr_file" {
  filename = local.csr_file

  depends_on = [
    null_resource.generate_csr,
  ]
}
