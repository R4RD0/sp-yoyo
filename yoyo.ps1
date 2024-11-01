function yoyo {
Write-Host "=== Checking Current Installations ==="

# Check Node.js version
Write-Host "Node.js version:"
node -v
if ($LASTEXITCODE -ne 0) { Write-Host "Node.js is not installed." }

# Check NPM version
Write-Host "NPM version:"
npm -v
if ($LASTEXITCODE -ne 0) { Write-Host "NPM is not installed." }

# Check Yeoman (yo) version
Write-Host "Yeoman (yo) version:"
yo --version
if ($LASTEXITCODE -ne 0) { Write-Host "Yeoman (yo) is not installed." }

# Check Gulp version
Write-Host "Gulp version:"
gulp -v
if ($LASTEXITCODE -ne 0) { Write-Host "Gulp is not installed." }

# Check SPFx Generator version
Write-Host "SPFx Generator version:"
npm list -g --depth=0 @microsoft/generator-sharepoint
if ($LASTEXITCODE -ne 0) { Write-Host "SPFx Generator is not installed." }

Write-Host ""
Write-Host "=== Starting Setup ==="

# Step 1: Uninstall global packages that might cause conflicts
Write-Host "Uninstalling global packages: yo, gulp, @microsoft/generator-sharepoint..."
npm uninstall -g yo gulp @microsoft/generator-sharepoint

# Step 2: Clear NPM cache
Write-Host "Clearing NPM cache..."
npm cache clean --force

# Step 3: Install Node.js version 16 using NVM for Windows
Write-Host "Installing Node.js v16 using NVM..."

# Check if NVM is installed
if (Get-Command nvm -ErrorAction SilentlyContinue) {
    Write-Host "NVM is installed."
} else {
    Write-Host "NVM is not installed. Please install NVM for Windows before running this script."
    Write-Host "Installation instructions: https://github.com/coreybutler/nvm-windows"
    exit 1
}

# Install and use Node.js v16
nvm install 16.20.0
nvm use 16.20.0

# Step 4: Update NPM to the latest version
Write-Host "Updating NPM to the latest version..."
npm install -g npm

# Step 5: Install global dependencies
Write-Host "Installing global dependencies: yo@3, gulp-cli, @microsoft/generator-sharepoint..."
npm install -g yo@3 gulp-cli @microsoft/generator-sharepoint

# Step 6: Verify installations
Write-Host ""
Write-Host "=== Verifying Installations ==="

Write-Host "Node.js version:"
node -v

Write-Host "NPM version:"
npm -v

Write-Host "Yeoman (yo) version:"
yo --version

Write-Host "Gulp version:"
gulp -v

Write-Host "SPFx Generator version:"
npm list -g --depth=0 @microsoft/generator-sharepoint

Write-Host ""
Write-Host "=== Setup Complete ==="
Write-Host "You can now create a new SPFx project using the Yeoman generator."
}
yoyo
