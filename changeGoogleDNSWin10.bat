:: Set primary and alternate DNS for IPv4 and IPV on Windows Server 2016 & 10
::script refer from https://superuser.com/questions/463096/change-dns-with-script

@ECHO OFF
SETLOCAL EnableDelayedExpansion

SET adapterName=

FOR /F "tokens=* delims=:" %%a IN ('IPCONFIG ^| FIND /I "ETHERNET"') DO (
SET adapterName=%%a

REM Removes "Ethernet adapter" from the front of the adapter name
SET adapterName=!adapterName:~17!

REM Removes the colon from the end of the adapter name
SET adapterName=!adapterName:~0,-1!

REM Remo
netsh interface ipv4 set dns name="!adapterName!" static 8.8.8.8 primary
netsh interface ipv4 add dns name="!adapterName!" 8.8.4.4 index=2
netsh interface ipv6 set dns name="!adapterName!" static 2001:4860:4860::8888 primary
netsh interface ipv6 add dns name="!adapterName!" 2001:4860:4860::8844 index=2
)

ipconfig /flushdns

FOR /F "tokens=* delims=:" %%a IN ('IPCONFIG ^| FIND /I "WI-FI"') DO (
SET adapterName=%%a

REM Removes "Ethernet adapter" from the front of the adapter name
SET adapterName=!adapterName:~21!

REM Removes the colon from the end of the adapter name
SET adapterName=!adapterName:~0,-1!

REM Remo
netsh interface ipv4 set dns name="!adapterName!" static 8.8.8.8 primary
netsh interface ipv4 add dns name="!adapterName!" 8.8.4.4 index=2
netsh interface ipv6 set dns name="!adapterName!" static 2001:4860:4860::8888 primary
netsh interface ipv6 add dns name="!adapterName!" 2001:4860:4860::8844 index=2
)

ipconfig /flushdns

:EOF
