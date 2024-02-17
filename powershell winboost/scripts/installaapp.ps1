Write-Host "#######UNLOCK POWESHELL#####"
##abilita script powershell
# Ottiene la politica di esecuzione corrente per la macchina locale
$currentPolicy = Get-ExecutionPolicy -Scope LocalMachine

# Controlla se la politica corrente non è 'Unrestricted'
if ($currentPolicy -ne 'Unrestricted') {
    # Imposta la politica di esecuzione su 'Unrestricted'
    Set-ExecutionPolicy Unrestricted -Scope LocalMachine -Force
    Write-Host "PS ExecutionPolicy cambiata in Unrestricted."
} else {
    Write-Host "PS ExecutionPolicy è già Unrestricted."
}


Write-Host "#######UAC DISABLER#####"
##DISABILITA UAC (PER RIABILITARLO IMPOSTA 1 ANZICHè 0)
Set-Itemproperty -path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\policies\system' -Name 'EnableLUA' -value 0
Write-Host "UAC DISABLE"


Write-Host "#######INSTALL WINGET#####"
# Tentativo di eseguire un comando winget per verificare se è installato
$wingetInstalled = $true
try {
    winget --version
} catch {
    $wingetInstalled = $false
}

# Se winget non è installato, procedere con l'installazione
if (-not $wingetInstalled) {
    # Impostare la preferenza di progresso per eseguire i download in modo silenzioso
    $progressPreference = 'silentlyContinue'
    Write-Information "Downloading WinGet and its dependencies..."
    
    # Scaricare WinGet e le sue dipendenze
    Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
    Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile Microsoft.VCLibs.x64.14.00.Desktop.appx
    Invoke-WebRequest -Uri https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.7.3/Microsoft.UI.Xaml.2.7.x64.appx -OutFile Microsoft.UI.Xaml.2.7.x64.appx
    
    # Installare le dipendenze e WinGet
    Add-AppxPackage Microsoft.VCLibs.x64.14.00.Desktop.appx
    Add-AppxPackage Microsoft.UI.Xaml.2.7.x64.appx
    Add-AppxPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle

    # Rimuovere i file scaricati
    Remove-Item Microsoft.VCLibs.x64.14.00.Desktop.appx
    Remove-Item Microsoft.UI.Xaml.2.7.x64.appx
    Remove-Item Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle

    # Accettare i termini del Microsoft Store per WinGet
    winget search --accept-source-agreements

    Write-Information "WinGet and its dependencies have been installed."
} else {
    Write-Information "WinGet is already installed."
}



Write-Host "#######INSTALL WIN APP#####"
# Array di pacchetti
$packages = @(
    # Pacchetti Visual C++
    'Microsoft.VCRedist.2008.x86'
    'Microsoft.VCRedist.2008.x64'
    'Microsoft.VCRedist.2010.x86'
    'Microsoft.VCRedist.2010.x64'
    'Microsoft.VCRedist.2012.x86'
    'Microsoft.VCRedist.2012.x64'
    'Microsoft.VCRedist.2013.x86'
    'Microsoft.VCRedist.2013.x64'
    'Microsoft.VCRedist.2015+.x86'
    'Microsoft.VCRedist.2015+.x64'


    # Pacchetti DirectX
    'Microsoft.DirectX'
    # Pacchetti Framework 4.5.1
    'Microsoft.DotNet.Framework.DeveloperPack_4'

)

# Installa tutti i pacchetti
ForEach ($packageName in $packages) {
    Write-Host "Installazione di $packageName in corso..."
    winget install $packageName -e  --accept-source-agreements
    Write-Host "Installazione di $packageName completata!"
}

# Messaggio di completamento
Write-Host "Installazione di tutti i pacchetti completata!"


Write-Host "#######INSTALL USER APP#####"

# Array di pacchetti
$packages = @(
    # Pacchetti Visual C++
    '7zip.7zip'
    'Git.Git'
    'Brave.Brave'
    'Python.Python.3.9'
    'Microsoft.VisualStudio.2022.Community'
    'Discord.Discord'
    'Valve.Steam'
    'EpicGames.EpicGamesLauncher'
    'RiotGames.Valorant.EU'
    'ElectronicArts.EADesktop'
    'GitHub.GitHubDesktop'
    'Nvidia.GeForceExperience'
    #'Nvidia.CUDA --version 11.8'



)

# Installa tutti i pacchetti
ForEach ($packageName in $packages) {
    Write-Host "Installazione di $packageName in corso..."
    winget install $packageName -e  --accept-source-agreements
    Write-Host "Installazione di $packageName completata!"
}

# Messaggio di completamento
Write-Host "Installazione di tutti i pacchetti completata!"
