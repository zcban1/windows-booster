# Elenco dei nomi degli script in ordine di esecuzione
$scriptNames = @(
    "installaapp.ps1",
    "block-telemetry.ps1",
    "disable-services.ps1",
    "disable-windows-defender.ps1",
    "optimize-windows-update.ps1",
    "opEthernet.ps1",
    "remove-default-apps.ps1",
    "experimental_unfuckery.ps1",
    "servicetomanual.ps1",
    "RemoveAppAutoStarts.ps1",
    "appdataremover.ps1"
    "ssd-tune.ps1"
    "DisableAdminPass.ps1"
    "firewalldisabler.ps1"
    "winclean.ps1"
    "DeleteOldDeviceWin.ps1"
)

# Percorso di partenza per la ricerca degli script
$startPath = "C:\Users"

# Crea un hashtable per mappare i nomi degli script ai loro percorsi
$scriptPaths = @{}

# Cerca gli script nel filesystem
Get-ChildItem -Path $startPath -Filter "*.ps1" -Recurse | ForEach-Object {
    # Verifica se il nome dello script corrisponde a uno degli script desiderati
    if ($_.Name -in $scriptNames) {
        $scriptPaths[$_.Name] = $_.FullName
    }
}

# Esegue gli script in base all'ordine definito in $scriptNames
foreach ($name in $scriptNames) {
    if ($scriptPaths.ContainsKey($name)) {
        $scriptPath = $scriptPaths[$name]
        echo "Eseguo PowerShell con privilegi amministrativi per: $scriptPath"
        Start-Process PowerShell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`"" -Verb RunAs -Wait
    }
    else {
        Write-Warning "Script $name non trovato."
    }
}
