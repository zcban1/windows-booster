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

