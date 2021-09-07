
setx -m QT_QMAKE_EXTENSION_HOME %INSTALL_DIR%
setx -m CONAN_QT_QMAKE_HOME %INSTALL_DIR%\conan
setx -m applyConanPlugin %INSTALL_DIR%\conan\conan.pri
setx -m applyCommonConfig %INSTALL_DIR%\config\commonConfig.pri
setx -m applyDestDirConfig %INSTALL_DIR%\config\destDirConfig.pri
setx -m setGitRevision %INSTALL_DIR%\utils\setGitRev.pri