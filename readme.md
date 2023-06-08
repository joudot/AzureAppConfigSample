Followed instructions https://learn.microsoft.com/en-us/azure/azure-app-configuration/quickstart-aspnet-core-app?tabs=core6x

Used the read only key as a connection string.

Created two key Vaults with RBAC policies and my account as Admin to create two secrets.

Followed App Config <-> Key Vault doc to integrate/initialize the Key Vault authentication https://learn.microsoft.com/en-us/azure/azure-app-configuration/use-key-vault-references-dotnet-core?tabs=core5x#update-your-code-to-use-a-key-vault-reference

Used DEV and PROD labels for secrets configurations pointing to different key vault (for PROD vs for DEV): https://learn.microsoft.com/en-us/azure/azure-app-configuration/howto-labels-aspnet-core?tabs=core5x