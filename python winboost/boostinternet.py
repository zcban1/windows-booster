import subprocess
import os
import time

# Definisce il contenuto dello script PowerShell
ps_script_content = """
# Aumenta la dimensione della coda di ricezione TCP
netsh int tcp set global autotuninglevel=normal

# Abilita il Direct Cache Access per migliorare le prestazioni della rete
netsh int tcp set global dca=enabled

# Disabilita l'agendamento del pacchetto QoS per prevenire la riserva di larghezza di banda
gpupdate /force

# Disabilita l'indice di scaling della finestra TCP per migliorare le prestazioni di trasferimento dati su larghe distanze
netsh int tcp set global rss=enabled ecncapability=enabled

netsh int tcp set global autotuninglevel=disabled

#elimina cache dns
ipconfig /flushdns

# Reset client DNS
netsh interface ip delete arpcache
netsh winsock reset

"""


# Imposta il percorso e il nome del file dello script PowerShell
desktop_path = os.path.join(os.path.expanduser("~"), "Desktop")
ps_script_filename = "manage_devices.ps1"
ps_script_path = os.path.join(desktop_path, ps_script_filename)

# Scrive lo script PowerShell in un file
with open(ps_script_path, "w") as ps_script_file:
    ps_script_file.write(ps_script_content)

# Comando per eseguire lo script PowerShell come amministratore
run_as_admin_command = f"powershell Start-Process powershell -ArgumentList '-File {ps_script_path}' -Verb RunAs"

# Esegue lo script PowerShell come amministratore
subprocess.run(run_as_admin_command, shell=True)

# [OPZIONALE] Attesa per simulare l'attesa del completamento dello script
# Questo passo è opzionale e dipende da quanto tempo ci si aspetta che lo script impieghi
#time.sleep(3)

# Elimina il file dello script PowerShell dopo l'esecuzione
# Si consiglia di utilizzare questa riga con cautela e di assicurarsi che lo script PowerShell sia effettivamente terminato
#os.remove(ps_script_path)




