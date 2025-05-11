@echo off & setlocal EnableDelayedExpansion
for /f "delims=" %%i in ('"dir /a/s/b/on *.ts*"') do (
del %%i /q
)