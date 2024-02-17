import ctypes
import os
import subprocess

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
        except subprocess.CalledProcessError as e:
            print(f"Error: {e.stderr}")
    else:
        ctypes.windll.shell32.ShellExecuteW(None, "runas", "python", f'"{os.path.abspath(__file__)}" {command}', None, 1)

def enable_automatic_drivers_installing():
    run_command_as_admin('reg add "HKCU\\Software\\Policies\\Microsoft\\Windows\\DriverSearching" /v "DontPromptForWindowsUpdate" /t REG_DWORD /d "0" /f')
    run_command_as_admin('reg add "HKLM\\Software\\Policies\\Microsoft\\Windows\\DriverSearching" /v "DontPromptForWindowsUpdate" /t REG_DWORD /d "0" /f')
    run_command_as_admin('reg add "HKLM\\Software\\Policies\\Microsoft\\Windows\\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "0" /f')
    print("Automatic drivers installing has been enabled successfully!")

def disable_automatic_drivers_installing():
    run_command_as_admin('reg add "HKCU\\Software\\Policies\\Microsoft\\Windows\\DriverSearching" /v "DontPromptForWindowsUpdate" /t REG_DWORD /d "1" /f')
    run_command_as_admin('reg add "HKLM\\Software\\Policies\\Microsoft\\Windows\\DriverSearching" /v "DontPromptForWindowsUpdate" /t REG_DWORD /d "1" /f')
    run_command_as_admin('reg add "HKLM\\Software\\Policies\\Microsoft\\Windows\\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f')
    print("Automatic drivers installing has been disabled successfully!")

# Example usage:
# enable_automatic_drivers_installing()
disable_automatic_drivers_installing()
