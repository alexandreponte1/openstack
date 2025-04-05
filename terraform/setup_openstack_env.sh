#!/bin/bash

set -e

echo "[+] Extraindo o certificado SSL do MicroStack (porta 5000)..."
openssl s_client -connect pop-os:5000 -showcerts </dev/null 2>/dev/null | \
awk '/-----BEGIN CERTIFICATE-----/,/-----END CERTIFICATE-----/' > ~/microstack.crt

echo "[+] Exportando variáveis de ambiente..."
export OS_REGION_NAME=microstack
export OS_CACERT=~/microstack.crt
export OS_AUTH_URL=https://pop-os:5000/v3
export OS_PROJECT_DOMAIN_NAME=Default
export OS_USERNAME=admin
export OS_USER_DOMAIN_NAME=Default
export OS_PROJECT_NAME=admin
export OS_PASSWORD=$(sudo snap get microstack config.credentials.keystone-password)

echo "[+] Buscando senha do admin no MicroStack..."
export OS_PASSWORD=$(sudo snap get microstack config.credentials.keystone-password)

echo "[✓] Ambiente pronto. Teste com:"
echo "    openstack project list"
echo "    terraform apply"

