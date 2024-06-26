# Sign in to your Azure account
# az login
# ------------------------------------------------------------------------
# List all subscriptions and count the number of active subscriptions
subscriptions=$(az account list --query "[?state=='Enabled']" --output json --only-show-errors | jq length)

echo "Active Subscriptions in the Azure Tenant: $subscriptions"

# ------------------------------------------------------------------------
# Count the number of Azure AD user accounts by display name
accounts=$(az ad user list --query "[].displayName" --output tsv --only-show-errors  | wc -l)

echo "Total number of Accounts in the Azure Entra: $accounts"
# ------------------------------------------------------------------------
# Get a list of all subscriptions in the tenant
subscriptions=$(az account list --query "[].id" --output tsv --only-show-errors)

# Loop through each subscription and count resources
total_resources=0
for sub in $subscriptions
do
    resources=$(az resource list --subscription "$sub" --query "length([])" )
    total_resources=$((total_resources + resources))
done

echo "Total number of Resources in the Azure Tenant: $total_resources"
# ------------------------------------------------------------------------
# Get a list of all subscriptions in the tenant
subscriptions=$(az account list --query "[].id" --output tsv --only-show-errors)

# Loop through each subscription and count security settings
total_settings=0
for sub in $subscriptions
do
    settings=$(az security setting list --subscription "$sub" --query "[].name" --output json | jq length)
    total_settings=$((total_settings + settings))
done

echo "Total number of Security Settings in the Azure Tenant: $total_settings"
# ------------------------------------------------------------------------
# Get a list of all active subscriptions in the tenant
subscriptions=$(az account list --query "[?state=='Enabled'].id" --output tsv --only-show-errors)

# Initialize a variable to store the total count
total_role_assignments=0

# Loop through each active subscription and count role assignments
for sub in $subscriptions
do
    role_assignments=$(az role assignment list --scope "/subscriptions/$sub" --query "[].id" --output json | jq length)
    total_role_assignments=$((total_role_assignments + role_assignments))
done

echo "Total number of Role Assignments across All subscriptions in the Azure Tenant: $total_role_assignments"
# ------------------------------------------------------------------------
# Get a list of all subscriptions in the tenant
subscriptions=$(az account list --query "[].id" --output tsv --only-show-errors)

# Initialize a variable to store the total count
total_public_ips=0

# Loop through each subscription and count public IPs
for sub in $subscriptions
do
    public_ips=$(az network public-ip list --subscription "$sub" --query "[].ipAddress" --output tsv | wc -l)
    total_public_ips=$((total_public_ips + public_ips))
done

echo "Total number of Public IP addresses across all subscriptions in the Azure Tenant: $total_public_ips"
# ------------------------------------------------------------------------

app_registrations=$(az ad app list --all --query "[].appId" --output tsv --only-show-errors | wc -l)

echo "Total number of App Registrations in the Azure Tenant: $app_registrations"
# ------------------------------------------------------------------------
# Get a list of all subscriptions in the tenant
subscriptions=$(az account list --query "[].id" --output tsv --only-show-errors)

# Initialize a variable to store the total count
total_resources=0

# Loop through each subscription and count resources
for sub in $subscriptions
do
    resources=$(az resource list --subscription "$sub" --query "length([*])" --output tsv)
    total_resources=$((total_resources + resources))
done

echo "Total number of Resources across all subscriptions in the Azure Tenant: $total_resources"
# ------------------------------------------------------------------------

aad_groups=$(az ad group list --query "[].displayName" --output tsv --only-show-errors | wc -l)

echo "Total number of Groups in the Azure Entra: $aad_groups"
# ------------------------------------------------------------------------
# Get a list of all subscriptions in the tenant
subscriptions=$(az account list --query "[].id" --output tsv --only-show-errors )

# Initialize a variable to store the total count
total_virtual_networks=0

# Loop through each subscription and count Virtual Networks
for sub in $subscriptions
do
    virtual_networks=$(az network vnet list --subscription "$sub" --query "length([])" --output tsv --only-show-errors )
    total_virtual_networks=$((total_virtual_networks + virtual_networks))
done

echo "Total number of Virtual Networks across all subscriptions in the Azure Tenant: $total_virtual_networks"
# ------------------------------------------------------------------------
# Get a list of all subscriptions in the tenant
subscriptions=$(az account list --query "[].id" --output tsv --only-show-errors)

# Initialize a variable to store the total count
total_vms=0

# Loop through each subscription and count VMs
for sub in $subscriptions
do
    vms=$(az vm list --subscription "$sub" --query "length([*])" --output tsv --only-show-errors)
    total_vms=$((total_vms + vms))
done

echo "Total number of Virtual Machines across all subscriptions in the Azure Tenant $total_vms"
# ------------------------------------------------------------------------
# Get a list of all subscriptions in the tenant
subscriptions=$(az account list --query "[].id" --output tsv --only-show-errors)

# Initialize a variable to store the total count
total_storage_accounts=0

# Loop through each subscription and count storage accounts
for sub in $subscriptions
do
    storage_accounts=$(az storage account list --subscription "$sub" --query "length([*])" --output tsv --only-show-errors)
    total_storage_accounts=$((total_storage_accounts + storage_accounts))
done

echo "Total number of Active Storage Accounts across all subscriptions in the Azure Tenant: $total_storage_accounts"
# ------------------------------------------------------------------------
# Get a list of all subscriptions in the tenant
subscriptions=$(az account list --query "[].id" --output tsv --only-show-errors)

# Initialize a variable to store the total count
total_functions=0

# Loop through each subscription and count Azure Functions
for sub in $subscriptions
do
    functions=$(az functionapp list --subscription "$sub" --query "length([*])" --output tsv --only-show-errors)
    total_functions=$((total_functions + functions))
done

echo "Total number of Azure Functions across all subscriptions in the Azure Tenant: $total_functions"
# ------------------------------------------------------------------------
