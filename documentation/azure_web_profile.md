# Setting Up the `AZURE_WEBAPP_PUBLISH_PROFILE` Secret

To set up the `AZURE_WEBAPP_PUBLISH_PROFILE` secret using the CLI, you'll need both the Azure CLI and GitHub CLI. Follow these steps:

## Step 1: Download the Azure Publish Profile

Ensure you have the Azure CLI installed and logged in.

```bash
# Log in to Azure
az login

# Set the subscription (if you have multiple)
az account set --subscription "your-subscription-name"

# Download the publish profile for your web app
az webapp deployment list-publishing-profiles --name your-app-name --resource-group your-resource-group --xml --output tsv > publishProfile.xml
```

## Step 2: Set the GitHub Secret

Ensure you have the GitHub CLI installed and authenticated.

```bash
# Log in to GitHub
gh auth login

# Set the secret in your GitHub repository
gh secret set AZURE_WEBAPP_PUBLISH_PROFILE --body "$(cat publishProfile.xml)" --repo your-username/your-repo-name
```

## Step 3: Clean Up

Remove the downloaded publish profile file for security reasons.

```bash
# Remove the publish profile file
rm publishProfile.xml
```

## Notes

- Replace `your-app-name`, `your-resource-group`, `your-subscription-name`, `your-username`, and `your-repo-name` with your actual Azure and GitHub details.
- Ensure that the Azure CLI and GitHub CLI are installed and configured on your machine.
- The `gh secret set` command requires that you have the necessary permissions to set secrets in the specified GitHub repository.
