@ECHO OFF
SET ThisScriptsDirectory=\\USALPLATP01\DropBox\Sidt_Saunders\Scripts\Script_Files\Delete_Selected_Profile\
SET PowerShellScriptPath=%ThisScriptsDirectory%Delete_Selected_Profile.ps1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%PowerShellScriptPath%""' -Verb RunAs}";