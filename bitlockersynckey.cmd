@echo off
manage-bde.exe -protectors -get C: -Type RecoveryPassword
echo Copy and paste the ID: {12345...} from above into
echo the ">" prompt below including the { and } brackets
set /p idkey=">"
manage-bde.exe -protectors -aadbackup C: -id %idkey%

