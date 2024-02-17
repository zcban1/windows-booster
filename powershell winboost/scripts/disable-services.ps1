#   Description:
# This script disables unwanted Windows services. If you do not want to disable
# certain services comment out the corresponding lines below.
                              

$services = @(
    "diagnosticshub.standardcollector.service", # Diagnostics Hub Standard Collector Service
    "DiagTrack",                                # Diagnostics Tracking Service
    "dmwappushservice",                         # WAP Push Message Routing Service (see known issues)
    "lfsvc",                                    # Geolocation Service
    "MapsBroker",                               # Downloaded Maps Manager
    "NetTcpPortSharing",                        # Net.Tcp Port Sharing Service
    "RemoteAccess",                             # Routing and Remote Access
    "RemoteRegistry",                           # Remote Registry
    "SharedAccess",                             # Internet Connection Sharing (ICS)
    "TrkWks",                                   # Distributed Link Tracking Client
    "WbioSrvc",                                 # Windows Biometric Service (required for Fingerprint reader / facial detection)
    "WlanSvc",                                  # WLAN AutoConfig (Disabling this can cause issues with wifi connectivity)
    "WMPNetworkSvc",                            # Windows Media Player Network Sharing Service
    "XblAuthManager",                           # Xbox Live Auth Manager
    "XblGameSave",                              # Xbox Live Game Save Service
    "XboxNetApiSvc",                            # Xbox Live Networking Service
    "ndu",                                      # Windows Network Data Usage Monitor
    "Spooler",                                  # Print Spooler
    "Fax",                                      # Fax
    "SysMain",                                  # Superfetch
    "wuauserv",                                 # Windows Update
    "wisvc"                                     # Windows Insider Service
    "WerSvc"                                    # Windows Error Reporting Service
    "wscsvc"                                    # Windows Security Center Service
    # Services which cannot be disabled
    #"WdNisSvc"
)

foreach ($service in $services) {
    Write-Output "Trying to disable $service"
    Get-Service -Name $service | Set-Service -StartupType Disabled
}


foreach ($service in $services) {
    Write-Output "Trying to disable $service"
    Get-Service -Name $service | Set-Service -StartupType Disabled
}
