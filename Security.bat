cls
@ECHO OFF
title Security System
Cd /d C:\Users\%USERNAME%\Documents
if EXIST "School" goto UNLOCK
if NOT EXIST Private goto MDLOCKER
:CONFIRM
Mode 1000 
color 4
echo Once locked, the files will be secured and encrypted with AES-256 encryption which is the strongets encryption, you cannot access it unless you enter the correct password.
timeout /t 5 /nobreak>nul
cls
color 2
echo Activating Encryption system...
timeout /t 5 /nobreak>nul
echo Encryption system activated successfully.
timeout /t 1 /nobreak>nul
echo Running encryption AES-256....
timeout /t 5 /nobreak>nul
echo Encryption successful.
timeout /t 2 /nobreak>nul
echo Awaiting confirmation...
timeout /t 1 /nobreak>nul
echo Are you sure you want to lock the folder(Y/N)
set/p "cho=>"
if %cho%==Y goto LOCK
if %cho%==y goto LOCK
if %cho%==n goto END
if %cho%==N goto END
echo Invalid choice.
goto CONFIRM
:LOCK
ren Private "School"
attrib +h +s "School"
echo Folder locked
goto End
:UNLOCK
color 2
echo The folder is secured.
timeout /t 2 /nobreak>nul
echo Enter the password to access it.
timeout /t 1 /nobreak>nul
set/p "pass=Password:"
if NOT %pass%== password goto FAIL
attrib -h -s "School"
Start "C:\Users\%USERNAME%\Documents"
echo Folder Unlocked successfully
ren "School" Private
goto End
:FAIL
echo Invalid password
goto end
:MDLOCKER
md Private
echo Private created successfully
goto End
:End
