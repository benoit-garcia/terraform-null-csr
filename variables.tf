variable "cn" {
  description = "Common Name of the certificate."
  type        = string
}

variable "country" {
  description = "Country of the Requestor"
  type        = string
  default     = "FR"
}

variable "key_size" {
  description = "Size of the RSA private key."
  type        = number
  default     = 4096
}

variable "location" {
  description = "Location (city) of the Requestor."
  type        = string
  default     = "Paris" # The most beautiful city in the World!
}

variable "organization" {
  description = "Name of the Requestor Organization (ie `Company Name`)."
  type        = string
  default     = "ACME company"
}

variable "san" {
  description = "Alternative Name of the Certificate."
  type        = list(string)
  default     = []
}
