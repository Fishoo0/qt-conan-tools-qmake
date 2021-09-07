#!/bin/sh

export INSTALL_DIR=~/Library/qt-qmake-extension
rm -rf $INSTALL_DIR
mkdir -p $INSTALL_DIR
cp -r * $INSTALL_DIR

echo '#START_OF_QT_QMAKE_EXTENSION' >> ~/.profile
echo export QT_QMAKE_EXTENSION_HOME=$INSTALL_DIR >> ~/.profile
echo export applyConanPlugin=$INSTALL_DIR/conan/conan.pri >> ~/.profile
echo export applyCommonConfig=$INSTALL_DIR/config/commonConfig.pri >> ~/.profile
echo export applyDestDirConfig=$INSTALL_DIR/config/destDirConfig.pri >> ~/.profile
echo export setGitRevision=$INSTALL_DIR/utils/setGitRev.pri >> ~/.profile
echo '#END_OF_QT_QMAKE_EXTENSION' >> ~/.profile

echo Conan Qt Plugin has been installed successfully, more detail check https://github.com/Fishoo0/qt-conan-tools-qmake.
echo call 'include($$(applyConanPlugin))' in your pro file to enable conan plugin
echo call 'include($$(applyCommonConfig))' in your pro file to enable common config
echo call 'include($$(applyDestDirConfig))' in your pro file to enable dest dir config
echo call 'include($$(setGitRevision))' in your pro file to set GIT_REVISION of your project