@echo off
set "default_box_name=ubuntu1604"
set /p "box_name=please input box name(default:ubuntu1604): "

if not defined box_name (
    set "box_name=%default_box_name%"
)
set box_file=%cd%\\%box_name%.box
if exist %box_file% (
    vagrant box add --name %box_name% %box_file%
    echo success
) else (
    echo not found:%box_file%
)
pause