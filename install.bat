@echo off

: install qt-conan-tools-qmake

net file 1>NUL 2>NUL & if ERRORLEVEL 1 (echo You must right-click and select "RUN AS ADMINISTRATOR"  to run this batch. Exiting... & echo. & pause & exit)

set INSTALL_DIR=C:\Qt\Tools\Conan\qt-conan-tools-qmake
rmdir /s /q %INSTALL_DIR%
xcopy %~dp0\* %INSTALL_DIR% /i /s /e

setx -m QT_QMAKE_EXTENSION_HOME %INSTALL_DIR%
setx -m CONAN_QT_QMAKE_HOME %INSTALL_DIR%\conan
setx -m applyConanPlugin %INSTALL_DIR%\conan\conan.pri
setx -m applyCommonConfig %INSTALL_DIR%\config\commonConfig.pri
setx -m setGitRevision %INSTALL_DIR%\utils\setGitRev.pri

echo.
echo Conan Qt Plugin has been installed successfully, more detail check https://github.com/Fishoo0/qt-conan-tools-qmake.
echo call 'include($$(applyConanPlugin))' in your pro file to enable conan plugin
echo call 'include($$(applyCommonConfig))' in your pro file to enable common config
echo call 'include($$(setGitRevision))' in your pro file to set GIT_REVISION of your project
echo.

pause
exit