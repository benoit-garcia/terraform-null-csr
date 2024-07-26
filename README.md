# cert-req-mgmt

This project is a demo on how one can use terraform to create Certificate Signing Request.
Before using it for real certificates, be sure to:

1. Use a secure storage for your state file
2. Disable the creation of files containing private keys and their password. Or at least push them in a more secure location than your git repository.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.5.6 |
| <a name="requirement_local"></a> [local](#requirement_local) | 2.5.1 |
| <a name="requirement_null"></a> [null](#requirement_null) | 3.2.2 |
| <a name="requirement_random"></a> [random](#requirement_random) | 3.6.2 |

## Resources

| Name | Type |
|------|------|
| [local_file.csr_config](https://registry.terraform.io/providers/hashicorp/local/2.5.1/docs/resources/file) | resource |
| [local_sensitive_file.key_password](https://registry.terraform.io/providers/hashicorp/local/2.5.1/docs/resources/sensitive_file) | resource |
| [null_resource.generate_csr](https://registry.terraform.io/providers/hashicorp/null/3.2.2/docs/resources/resource) | resource |
| [null_resource.generate_key](https://registry.terraform.io/providers/hashicorp/null/3.2.2/docs/resources/resource) | resource |
| [random_password.key_password](https://registry.terraform.io/providers/hashicorp/random/3.6.2/docs/resources/password) | resource |
| [local_file.csr_file](https://registry.terraform.io/providers/hashicorp/local/2.5.1/docs/data-sources/file) | data source |
| [local_sensitive_file.key](https://registry.terraform.io/providers/hashicorp/local/2.5.1/docs/data-sources/sensitive_file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cn"></a> [cn](#input_cn) | Common Name of the certificate. | `string` | n/a | yes |
| <a name="input_country"></a> [country](#input_country) | Country of the Requestor | `string` | `"FR"` | no |
| <a name="input_key_size"></a> [key_size](#input_key_size) | Size of the RSA private key. | `number` | `4096` | no |
| <a name="input_location"></a> [location](#input_location) | Location (city) of the Requestor. | `string` | `"Paris"` | no |
| <a name="input_organization"></a> [organization](#input_organization) | Name of the Requestor Organization (ie `Company Name`). | `string` | `"ACME company"` | no |
| <a name="input_san"></a> [san](#input_san) | Alternative Name of the Certificate. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_csr_content"></a> [csr_content](#output_csr_content) | Certificate Signing Request. |
| <a name="output_csr_sha512"></a> [csr_sha512](#output_csr_sha512) | SHA512 Digest of the Certificate Signing Request. |
| <a name="output_key_content"></a> [key_content](#output_key_content) | Certificate Private key. |
| <a name="output_key_password"></a> [key_password](#output_key_password) | Password of the Certificate Private Key. |
| <a name="output_key_sha512"></a> [key_sha512](#output_key_sha512) | SHA512 digest of the Certificate Private key. |
<!-- END_TF_DOCS -->

## License

MIT Licensed. See [LICENSE](https://github.com/benoit-garcia/cert-req-mgmt/tree/main/LICENSE) for full details.
