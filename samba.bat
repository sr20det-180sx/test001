echo off

echo;
echo net use S: /delete
net use S: /delete

echo;
echo net use S: \\192.168.11.133\nas-pi /user:sr20det_samba Zaq12wsX@1234567890
net use S: \\192.168.11.133\nas-pi /user:sr20det_samba Zaq12wsX@1234567890

set dt=%date%
set tm=%time: =0%
set FileName=%dt:~0,4%%dt:~5,2%%dt:~8,2%_%tm:~0,2%%tm:~3,2%%tm:~6,2%.log

CD /D %TEMP%

echo robocopy C:\Users\sr20det\Favorites S:\x270\Favorites /E /COPY:DT /MIR /DCOPY:DAT /R:0 /W:1 /FP /NP /MT:3 /LOG:R:\%FileName%
robocopy C:\Users\sr20det\Favorites S:\x270\Favorites /E /COPY:DT /MIR /DCOPY:DAT /R:0 /W:1 /FP /NP /MT:3 /LOG:R:\%FileName%

echo;
echo robocopy C:\Users\sr20det\Documents S:\x270\Documents /E /COPY:DT /MIR /DCOPY:DAT /R:0 /W:1 /FP /NP /MT:3 /XD "My Pictures" "My Music" "My Videos" /LOG+:R:\%FileName%
robocopy C:\Users\sr20det\Documents S:\x270\Documents /E /COPY:DT /MIR /DCOPY:DAT /R:0 /W:1 /FP /NP /MT:3 /XD "My Pictures" "My Music" "My Videos" /LOG+:R:\%FileName%

echo;
echo robocopy C:\Users\sr20det\Downloads S:\x270\Downloads /E /COPY:DT /MIR /DCOPY:DAT /R:0 /W:1 /FP /NP /MT:3 /LOG+:R:\%FileName%
robocopy C:\Users\sr20det\Downloads S:\x270\Downloads /E /COPY:DT /MIR /DCOPY:DAT /R:0 /W:1 /FP /NP /MT:3 /LOG+:R:\%FileName%

echo;
echo robocopy C:\Users\sr20det\Desktop S:\x270\Desktop /E /COPY:DT /MIR /DCOPY:DAT /R:0 /W:1 /FP /NP /MT:3 /LOG+:R:\%FileName%
robocopy C:\Users\sr20det\Desktop S:\x270\Desktop /E /COPY:DT /MIR /DCOPY:DAT /R:0 /W:1 /FP /NP /MT:3 /LOG+:R:\%FileName%

echo;
echo robocopy C:\Users\sr20det\Pictures S:\x270\Pictures /E /COPY:DT /MIR /DCOPY:DAT /R:0 /W:1 /FP /NP /MT:3 /LOG+:R:\%FileName%
robocopy C:\Users\sr20det\Pictures S:\x270\Pictures /E /COPY:DT /MIR /DCOPY:DAT /R:0 /W:1 /FP /NP /MT:3 /LOG+:R:\%FileName%

echo;
echo robocopy D: S:\x270\D_Drive /E /COPY:DT /MIR /DCOPY:DAT /R:0 /W:1 /FP /NP /MT:3 /XD "System Volume Information" "`$RECYCLE.BIN" /LOG+:R:\%FileName%
robocopy D: S:\x270\D_Drive /E /COPY:DT /MIR /DCOPY:DAT /R:0 /W:1 /FP /NP /MT:3 /XD "System Volume Information" "`$RECYCLE.BIN" /LOG+:R:\%FileName%

echo;
echo attrib -s -h S:\x270\D_Drive
attrib -s -h S:\x270\D_Drive

echo;
echo COPY R:\%FileName% S:\x270
COPY R:\%FileName% S:\x270

echo;
echo net use S: /delete
net use S: /delete

echo;
echo net use /PERSISTENT:NO
net use /PERSISTENT:NO

echo;
echo DIR R:\
DIR R:\
