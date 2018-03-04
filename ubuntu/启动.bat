@echo off
set vagrantfile_name=Vagrantfile
set vagrantfile_file=%cd%\\%vagrantfile_name%
if exist %vagrantfile_file% (
    vagrant halt 2>nul
    vagrant up --provision
) else (
    echo not found:%vagrantfile_file%
)
pause