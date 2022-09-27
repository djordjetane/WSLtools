powershell -command "& { iwr https://github.com/powerline/fonts/archive/master.zip -OutFile ~\fonts.zip }"
Expand-Archive -Path ~\fonts.zip -DestinationPath ~
Set-ExecutionPolicy Bypass -Force
~\fonts-master\install.ps1
Remove-Item ~\fonts.zip
Remove-Item -Recurse ~\fonts-master
Set-ExecutionPolicy Default
