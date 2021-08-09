@echo off

: install qt-conan-tools-qmake

net file 1>NUL 2>NUL & if ERRORLEVEL 1 (echo You must right-click and select "RUN AS ADMINISTRATOR"  to run this batch. Exiting... & echo. & pause & exit)

setx -m CONAN_QT_QMAKE_HOME %~dp0
setx -m applyConanPlugin %~dp0conan.pri

echo.
echo Conan Qt Plugin has been installed successfully. You can call 'include($$(applyConanPlugin))' or 'include($$(CONAN_QT_QMAKE_HOME)/conan.pri)' in your profile to enable conan plugin, more detail check https://github.com/Fishoo0/qt-conan-tools-qmake.
echo.

pause
exit