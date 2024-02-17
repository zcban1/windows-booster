# Lista dei nomi delle cartelle da eliminare
$foldersToDelete = @("Epic Games", "Riot Games", "Ubisoft Game Launcher", "Steam", "Package Cache")

# Percorsi AppData Local, Roaming e ProgramData
$appDataLocal = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::LocalApplicationData)
$appDataRoaming = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::ApplicationData)
$programData = [Environment]::GetFolderPath([Environment+SpecialFolder]::CommonApplicationData)

# Percorsi delle cartelle temporanee
$tempUser = [System.IO.Path]::GetTempPath()
$tempWindows = "C:\Windows\Temp"

# Funzioni di utilità per la pulizia (rimangono invariate)

function Remove-FolderIfExists {
    param (
        [string]$basePath,
        [string]$folderName = ""
    )
    $pathToDelete = Join-Path -Path $basePath -ChildPath $folderName
    if (Test-Path $pathToDelete) {
        try {
            Remove-Item -Path $pathToDelete -Recurse -Force -ErrorAction Stop
            Write-Output "Eliminata la cartella: $pathToDelete"
        } catch {
            Write-Warning "Non è stato possibile eliminare: $pathToDelete. Errore: $_"
        }
    } else {
        Write-Output "La cartella non esiste: $pathToDelete"
    }
}

function Remove-Contents {
    param (
        [string]$path
    )
    if (Test-Path $path) {
        Get-ChildItem -Path $path -Recurse | ForEach-Object {
            try {
                Remove-Item $_.FullName -Force -Recurse -ErrorAction Stop
            } catch {
                Write-Warning "Non è stato possibile eliminare l'oggetto: $($_.FullName). Errore: $_"
            }
        }
        Write-Output "Tentativo di eliminazione completato per: $path"
    } else {
        Write-Output "Il percorso non esiste: $path"
    }
}

# Pulizia delle cartelle specificate e delle cartelle temporanee
foreach ($folder in $foldersToDelete) {
    Remove-FolderIfExists -basePath $appDataLocal -folderName $folder
    Remove-FolderIfExists -basePath $appDataRoaming -folderName $folder
    Remove-FolderIfExists -basePath $programData -folderName $folder # Aggiunto ProgramData
}

Remove-Contents -path $tempUser
Remove-Contents -path $tempWindows

# Segue la sezione di pulizia aggiuntiva (rimane invariata)

