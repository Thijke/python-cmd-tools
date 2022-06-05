@echo off
color 0a
:start
echo welcome to python cmd tools, choose one
SET /P M="1 = python module installer, 2 = python module uninstaller and 3 = python file to exe. Choose a option: "
IF %M%==1 GOTO moduleinstaller
IF %M%==2 GOTO moduleuninstaller
IF %M%==3 GOTO pytoexestart

cls
echo u didnt choose one right..
echo try again
timeout /t 3 > nul
cls
goto start


:moduleinstaller
echo.
set /p i="Enter the name of the python module u wanna install: "
if [%i%]==[] ( 
    echo.
    echo bro enter a module name to install
    timeout /t 2 > nul
    cls
    goto moduleinstaller
)
pip install %i%
timeout /t 2 > nul
cls
goto start

:moduleuninstaller
echo.
set /p i="Enter the name of the python module u wanna uninstall: "
if [%i%]==[] ( 
    echo.
    echo bro enter a module name to uninstall
    timeout /t 2 > nul
    cls
    goto moduleuninstaller
)
pip uninstall %i%
timeout /t 2 > nul
cls
goto start


:pytoexestart
set /p n="Enter the python file name, make sure its in the same folder as the batch file: "
if [%n%]==[] ( 
    echo.
    echo bro enter a name
    timeout /t 2 > nul
    cls
    goto pytoexestart
)
:pytoexesecond
set /p a="Enter the exe name : "
if [%a%]==[] ( 
    echo.
    echo bro enter a name
    timeout /t 2 > nul
    cls
    goto pytoexesecond
) 
if [%a%] NEQ [] (
    echo.
    echo Name is: %a%
    pyinstaller --clean --onefile --noconsole -i NONE -n %a% %n%
    rmdir /s /q __pycache__
    rmdir /s /q build
    del /f / s /q %a%.spec
    echo.
    echo generated exe as %a%.exe in the dist folder
    timeout /t 2 > nul
    cls
    goto start
)