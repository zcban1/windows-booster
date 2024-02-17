# Percorsi nel Registro di sistema
$RegistryPaths = @(
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run",
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\RunOnce",
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run",
    "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Run",
    "HKCU:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Run"
)

# Funzione per eliminare le voci di avvio automatico da un percorso specifico nel Registro di sistema
function RemoveStartupEntries {
    param (
        [string]$Path
    )
    
    # Ottenere tutte le sottochiavi nel percorso specificato
    $StartupApps = Get-ItemProperty -Path $Path -ErrorAction SilentlyContinue

    # Verificare se ci sono voci di avvio automatico
    if ($null -eq $StartupApps) {
        Write-Host "Nessuna chiave di avvio automatico trovata da eliminare in $($Path)."
    }
    else {
        # Visualizzare le voci di avvio automatico attualmente presenti
        Write-Host "Voci di avvio automatico attualmente presenti in $($Path):"
        $StartupApps | Format-Table -Property *

        # Eliminare tutte le voci di avvio automatico senza conferma
        foreach ($app in $StartupApps.PSObject.Properties.Name) {
            Remove-ItemProperty -Path $Path -Name $app -ErrorAction SilentlyContinue
            Write-Host "Voci di avvio automatico eliminate con successo in $($Path)."
        }
    }
}

# Eseguire la funzione per ogni percorso nel Registro di sistema
foreach ($path in $RegistryPaths) {
    RemoveStartupEntries -Path $path
}
