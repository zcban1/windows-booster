# Inizio dello script
Write-Host "Inizio dello script per disabilitare il firewall di Windows."

# Disabilita il profilo firewall del Dominio
Write-Host "Disabilitazione del profilo firewall del Dominio in corso..."
Set-NetFirewallProfile -Profile Domain -Enabled False
Write-Host "Profilo firewall del Dominio disabilitato."

# Disabilita il profilo firewall Privato
Write-Host "Disabilitazione del profilo firewall Privato in corso..."
Set-NetFirewallProfile -Profile Private -Enabled False
Write-Host "Profilo firewall Privato disabilitato."

# Disabilita il profilo firewall Pubblico
Write-Host "Disabilitazione del profilo firewall Pubblico in corso..."
Set-NetFirewallProfile -Profile Public -Enabled False
Write-Host "Profilo firewall Pubblico disabilitato."

# Conclusione dello script
Write-Host "Tutti i profili del firewall di Windows sono stati disabilitati."
Write-Host "Fine dello script."
