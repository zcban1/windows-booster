import os
import subprocess
import time

sleepp=1
def run_command(command, timeout=1):
    try:
        subprocess.run(command, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
    except subprocess.CalledProcessError:
        print(f"Error executing command: {command}")

def main():
    print("python disable_uac.py.")
    run_command("python disable_uac.py")
    time.sleep(sleepp)
    print("disable_uac.py completed.")

    print("sbloccapwscript.py.")
    run_command("sbloccapwscript.py")
    time.sleep(sleepp)
    print("sbloccapwscript.py completed.")

    print("installwinget.py.")
    run_command("installwinget.py")
    time.sleep(sleepp)
    print("installwinget.py completed.")

    print("installallVC+DX+FRAMEWORL48.py.")
    run_command("installallVC+DX+FRAMEWORL48.py")
    time.sleep(sleepp)
    print("installallVC+DX+FRAMEWORL48.py completed.")

    print("disable_windows_defender.py")
    run_command("disable_windows_defender.py")
    time.sleep(sleepp)
    print("disable_windows_defender.py completed.")

    print("windows-update-hide.py")
    run_command("windows-update-hide.py")
    time.sleep(1)
    print("windows-update-hide.py")

    print("disable_notifications.py")
    run_command("disable_notifications.py")
    time.sleep(sleepp)
    print("disable_notifications.py completed.")

    print("disable_xbox_service.py")
    run_command("disable_xbox_service.py")
    time.sleep(sleepp)
    print("disable_xbox_service.py completed.")

    print("visrtualmemory.py")
    run_command("visrtualmemory.py")
    time.sleep(sleepp)
    print("visrtualmemory.py completed.")



    print("disable_readyboost_and_memory_compression.py")
    run_command("disable_readyboost_and_memory_compression.py")
    time.sleep(1)
    print("disable_readyboost_and_memory_compression.py")

    print("disable_onedrive.py")
    run_command("disable_onedrive.py")
    time.sleep(sleepp)
    print("disable_onedrive.py")



    print("disable_firewall.py")
    run_command("disable_firewall.py")
    time.sleep(sleepp)
    print("disable_firewall.py")

    print("disable_automatic_drivers_installing.py")
    run_command("disable_automatic_drivers_installing.py")
    time.sleep(sleepp)
    print("disable_automatic_drivers_installing.py completed.")

   
    print("disabilita_servizi_inutili.py")
    run_command("disabilita_servizi_inutili.py")
    time.sleep(sleepp)
    print("disabilita_servizi_inutili.py completed.")

    print("removeautostartapp.py")
    run_command("removeautostartapp.py")
    time.sleep(sleepp)
    print("removeautostartapp.py completed.")

    print("olddeviceclean.py")
    run_command("olddeviceclean.py")
    time.sleep(sleepp)
    print("olddeviceclean.py completed.")

    print("servicefromautotomanual.py")
    run_command("servicefromautotomanual.py")
    time.sleep(sleepp)
    print("servicefromautotomanual.py completed.")

    print("preference.py")
    run_command("preference.py")
    time.sleep(sleepp)
    print("preference.py completed.")

    print("boostinternet.py")
    run_command("boostinternet.py")
    time.sleep(sleepp)
    print("boostinternet.py completed.")

    print("Disable-AdminPasswordPrompts.py")
    run_command("Disable-AdminPasswordPrompts.py")
    time.sleep(sleepp)
    print("Disable-AdminPasswordPrompts.py completed.")

    print("ssd_tune.py")
    run_command("ssd_tune.py")
    time.sleep(sleepp)
    print("ssd_tune.py completed.")

    print("ResetCleanV2.py")
    run_command("ResetCleanV2.py")
    time.sleep(sleepp)
    print("ResetCleanV2.py completed.")

    print(f"Results have been saved")

    print("Riavvio del computer in corso...")
    os.system("shutdown /r /t 0 /f /d p:4:1")


if __name__ == "__main__":
    main()

