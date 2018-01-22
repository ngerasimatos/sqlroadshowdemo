#!/bin/bash

#create keypair
echo "ssh-keygen -t rsa"
ssh-keygen -t rsa
read -n 1 -s

#create resource group
echo "az group create -n <name> -l <location>"
read -n 1 -s
echo "az group create -n ngocpkeyvaultgroup -l 'East US'"
read -n 1 -s
az group create -n ngocpkeyvaultgroup -l 'East US'
read -n 1 -s

#create key vault
echo "Create Key Vault"
read -n 1 -s
echo "az keyvault create -n <vault-name> -g <resource-group> -l <location> --enabled-for-template-deployment true"
read -n 1 -s
echo "az keyvault create -n ngocpkeyvaultname -g ngocpkeyvaultgroup -l 'East US' --enabled-for-template-deployment true"
read -n 1 -s
az keyvault create -n ngocpkeyvaultname -g ngocpkeyvaultgroup -l 'East US' --enabled-for-template-deployment true
read -n 1 -s

#create secret
echo "Create Secret: az keyvault secret set --vault-name <vault-name> -n <secret-name> --file <private-key-file-name>"
read -n 1 -s
echo "az keyvault secret set --vault-name ngocpkeyvaultname -n ngocpkeyvaultname --file ~/.ssh/id_rsa"
read -n 1 -s
az keyvault secret set --vault-name ngocpkeyvaultname -n ngocpkeyvaultname --file ~/.ssh/id_rsa
read -n 1 -s

#create resource group
echo "az group create -n <name> -l <location>"
read -n 1 -s
echo "az group create -n ngocpbyol -l 'East US'"
read -n 1 -s
az group create -n ngocpbyol -l 'East US'

#Generate Azure Active Directory Service Principal
echo "az ad sp create-for-rbac -n <friendly name> --password <password> --role contributor --scopes /subscriptions/<subscription_id>/resourceGroups/<Resource Group Name>"
read -n 1 -s
echo "az ad sp create-for-rbac -n ocpazadsp --password ocpazadsp --role contributor --scopes /subscriptions/b733b6a9-e6c9-43f6-8bfc-102d1379a9ea/resourceGroups/ngocpbyol"
read -n 1 -s
az ad sp create-for-rbac -n ocpazadsp --password ocpazadsp --role contributor --scopes /subscriptions/b733b6a9-e6c9-43f6-8bfc-102d1379a9ea/resourceGroups/ngocpbyol
read -n 1 -s
