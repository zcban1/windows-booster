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
        try:
            result = subprocess.run(command, shell=True, capture_output=True, text=True, check=True)
            print(f"Output: {result.stdout}")
            if result.stderr:
                print(f"Error: {result.stderr}")
        except subprocess.CalledProcessError as e:
            print(f"Error: {e.stderr}")
    else:
        # Utilizza ShellExecuteW per elevare i permessi se lo script non è già in esecuzione come amministratore
        ctypes.windll.shell32.ShellExecuteW(None, "runas", "cmd.exe", f'/c {command}', None, 1)

def disable_microsoft_store():
    command = 'REG ADD "HKEY_LOCAL_MACHINE\\Software\\Policies\\Microsoft\\WindowsStore" /v "RemoveWindowsStore" /t REG_DWORD /d 1 /f'
    run_command_as_admin(command)
    print("Il Microsoft Store è stato disabilitato con successo.")

def enable_microsoft_store():
    command = 'REG DELETE "HKEY_LOCAL_MACHINE\\Software\\Policies\\Microsoft\\WindowsStore" /v "RemoveWindowsStore" /f'
    run_command_as_admin(command)
    print("Il Microsoft Store è stato abilitato con successo.")

disable_microsoft_store()
