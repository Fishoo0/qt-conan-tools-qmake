@echo off

: install qt-conan-tools-qmake

net file 1>NUL 2>NUL & if ERRORLEVEL 1 (echo You must right-click and select "RUN AS ADMINISTRATOR"  to run this batch. Exiting... & echo. & pause & exit)

set INSTALL_DIR=C:\Qt\Tools\Conan\qt-conan-tools-qmake
rmdir /s /q %INSTALL_DIR%
xcopy %~dp0\* %INSTALL_DIR% /i

setx -m CONAN_QT_QMAKE_HOME %INSTALL_DIR%
setx -m applyConanPlugin %INSTALL_DIR%\conan.pri

echo.
echo Conan Qt Plugin has been installed successfully. You can call 'include($$(applyConanPlugin))' or 'include($$(CONAN_QT_QMAKE_HOME)/conan.pri)' in your profile to enable conan plugin, more detail check https://github.com/Fishoo0/qt-conan-tools-qmake.
echo.

pause
exit