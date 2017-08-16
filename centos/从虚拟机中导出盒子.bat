@echo off
set "default_vm_name=lnmp-1"
set /p "vm_name=please input vm name(default:lnmp-1): "

if not defined vm_name (
    set "vm_name=%default_vm_name%"
)

echo -------- please wait ---------
vagrant package --base %vm_name% --output %cd%\\%vm_name%.box
echo %cd%\\%vm_name%.box
pause