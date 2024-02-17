# Pulizia aggiuntiva

# Svuotamento del Cestino
Clear-RecycleBin -Confirm:$false -ErrorAction SilentlyContinue

# Pulizia dei file temporanei di sistema con cleanmgr (richiede configurazione predefinita)
Start-Process "cleanmgr" "/sagerun:11" -Wait

# Rimozione dei file di hibernazione (se non necessari)
powercfg -h off

# Pulizia dei log di Windows e dei file temporanei
Remove-Item "$env:SystemRoot\Logs\*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue

# Rimozione degli aggiornamenti di Windows non riusciti o obsoleti
DISM /Online /Cleanup-Image /StartComponentCleanup

# NOTA: Il comando seguente eliminerà tutti i punti di ripristino eccetto l'ultimo.
# Usalo con cautela e solo se hai compreso le implicazioni.
vssadmin delete shadows /All /Quiet

###remove nvidia driver backup
Remove-Item -Path "C:\Program Files\NVIDIA Corporation\Installer2" -Recurse -Force
