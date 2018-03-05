@echo off
set vagrantfile_name=Vagrantfile
set vagrantfile_file=%cd%\\%vagrantfile_name%
if exist %vagrantfile_file% (
    vagrant halt
) else (
    echo not found:%vagrantfile_file%
)
pause