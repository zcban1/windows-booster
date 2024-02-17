import subprocess
import ctypes
import os

def is_admin():
    try:
        return ctypes.windll.shell32.IsUserAnAdmin()
    except:
        return False

def run_command_as_admin(command):
    if is_admin():
        print(f"Esecuzione del comando: {command}")  # Messaggio di debug prima dell'esecuzione
        try:
            result = subprocess.run(command, shell=True, capture_output=True, text=True, check=True)
            if result.stdout:
                print(f"Output: {result.stdout}")  # Stampa l'output del comando se presente
            if result.stderr:
                print(f"Error: {result.stderr}")  # Stampa l'errore del comando se presente
        except subprocess.CalledProcessError as e:
            print(f"Error: {e.stderr}")
    else:
        #print("Non sono stati concessi i privilegi di amministratore. Tentativo di elevazione...")
        # Tenta di elevare i permessi se non eseguito come amministratore
        ctypes.windll.shell32.ShellExecuteW(None, "runas", "cmd.exe", f'/c {command}', None, 1)

def disabilita_servizi_inutili():
    print("Inizio della disabilitazione dei servizi inutili...")
    servizi_inutili = [
        "Spooler", "Fax", "TapiSrv", "HomeGroupProvider", "HomeGroupListener",
        "NetTcpPortSharing", "MessagingService", "WpnUserService", "RemoteRegistry",
        "lfsvc", "MapsBroker", "dmwappushsvc", "XblGameSave", "XboxNetApiSvc",
        "XboxGipSvc", "DPS", "PrintWorkflowUserSvc", "WalletService"
    ]
    for servizio in servizi_inutili:
        comando = f'reg add "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\{servizio}" /v "Start" /t REG_DWORD /d 4 /f'
        print("Tentativo per ",{servizio})
        run_command_as_admin(comando)
    print("Fine della disabilitazione dei servizi inutili.")

def riabilita_servizi_inutili():
    print("Inizio della riabilitazione dei servizi inutili...")
    servizi_inutili = [
        "Spooler", "Fax", "TapiSrv", "HomeGroupProvider", "HomeGroupListener",
        "NetTcpPortSharing", "MessagingService", "WpnUserService", "RemoteRegistry",
        "lfsvc", "MapsBroker", "dmwappushsvc", "XblGameSave", "XboxNetApiSvc",
        "XboxGipSvc", "DPS", "PrintWorkflowUserSvc", "WalletService"
    ]
    for servizio in servizi_inutili:
        comando = f'reg add "HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\{servizio}" /v "Start" /t REG_DWORD /d 2 /f'
        print("Tentativo per ",{servizio})
        run_command_as_admin(comando)
    print("Fine della riabilitazione dei servizi inutili.")



disabilita_servizi_inutili()
