@echo off
set "default_vm_name=ubuntu1604"
set /p "vm_name=please input vm name(default:ubuntu1604): "

if not defined vm_name (
    set "vm_name=%default_vm_name%"
)

echo -------- please wait ---------
vagrant package --base %vm_name% --output %cd%\\%vm_name%.box
echo %cd%\\%vm_name%.box
pause