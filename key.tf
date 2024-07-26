resource "random_password" "key_password" {
  length  = 32
  special = true
}

resource "local_sensitive_file" "key_password" {
  filename = local.key_password_file
  content  = random_password.key_password.result
}

resource "null_resource" "generate_key" {
  provisioner "local-exec" {
    command = format("openssl genrsa -out %s -passout file:%s %s", local.key_file, local.key_password_file, var.key_size)
  }

  depends_on = [
    local_sensitive_file.key_password,
  ]
}

data "local_sensitive_file" "key" {
  filename = local.key_file

  depends_on = [
    null_resource.generate_key,
  ]
}
