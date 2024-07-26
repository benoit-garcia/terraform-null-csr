#!/bin/bash

set -e

if [[ $# -ne 1 ]]; then
  echo "Missing parameters <cn>"
  echo "usage: ${0} <cn>"
  exit 1
fi

tfvars_file=input/${1}.tfvars
if [[ ! -f ${tfvars_file} ]]; then
  echo "File ${tfvars_file} doesn't exist."
  exit 2
fi

echo "# CSR Generator"
echo -e "\n## Setup terraform:"
terraform init > /dev/null
terraform version

echo -e "\n## Switch to workspace ${1}."
terraform workspace select "${1}" > /dev/null 2>&1 \
  || terraform workspace new "${1}" > /dev/null

echo -e "\n## Generate or update CSR."
terraform \
  apply \
  -var-file="input/${1}.tfvars" \
  -auto-approve \
  > /dev/null

echo -e "\n## Private Key:"
echo -e "### Private Key content:"
terraform output -raw key_content
echo -e "### Private Key sha512 Digest:"
terraform output -raw key_sha512
echo -e "\n### Private Key password:"
terraform output -raw key_password
echo -e "\n\n## CSR:"
echo -e "### CSR content:"
terraform output -raw csr_content
echo -e "### CSR sha512 Digest:"
terraform output -raw csr_sha512
echo ""
