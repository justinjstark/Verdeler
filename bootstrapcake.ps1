Write-Host "Bootstrapping Cake"

$TOOLS_DIR = Join-Path $PSScriptRoot "tools"
$NUGET_EXE = Join-Path $TOOLS_DIR "nuget.exe"
$CAKE_EXE = Join-Path $TOOLS_DIR "Cake/Cake.exe"

# Try download NuGet.exe if do not exist.
if (!(Test-Path $NUGET_EXE)) {
    Invoke-WebRequest -Uri http://nuget.org/nuget.exe -OutFile $NUGET_EXE
}

# Make sure NuGet exists where we expect it.
if (!(Test-Path $NUGET_EXE)) {
    Throw "Could not find NuGet.exe"
}

# Restore tools from NuGet.
Push-Location
Set-Location $TOOLS_DIR
Invoke-Expression "$NUGET_EXE install -ExcludeVersion"
Pop-Location
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

# Make sure that Cake has been installed.
if (!(Test-Path $CAKE_EXE)) {
    Throw "Could not find Cake.exe"
}

# Start Cake
#Invoke-Expression "$CAKE_EXE `"$Script`" -target=`"$Target`" -configuration=`"$Configuration`" -verbosity=`"$Verbosity`" $UseDryRun $UseExperimental"
Write-Host "Done Bootstrapping Cake"
exit $LASTEXITCODE