# About Me

    Qt Qmake tools for Conan

# Basic Usage
    1, git clone git@github.com:Fishoo0/qt-conan-tools-qmake.git to YOUR_LOCATION
    2, Set system evn：CONAN_QT_QMAKE_HOME = YOUR_LOCATION
    3, In your pro file, adding 'include($$(CONAN_QT_QMAKE_HOME)/conan.pri)'
    4, In the same directory of your pro file, adding your conanfile.txt
    5, call qmake, conan will do the rest job for you.


# Demo
    your_project_dir
        your_project.pro
            CONAN_INSTALL_PARAMS = "--update"
            include($$(CONAN_QT_QMAKE_HOME)/conan.pri)
        conanfile.txt
            [requires]
            openssl/1.1.1k
            [generators]
            qmake
            [options]
    
    call 'qmake'


# Advantage usage
### Behind Logic
    Take advantage of 'qmake' system to run 'conan'
### Conan Standard Work Flow
    work flow：
    1, cmd 'conan install LOCATION_OF_CONANFILE YOUR_PARAMS' generate cmake or qmake scripts: conanbuildinfo
    2, include(conanbuildinfo.pri), and call CONFIG += conan_basic_setup to setup conan
### Tool Work Flow
    'conan.pri' you called simply calls the following script

    1, call conanInstall.pri, witch calls 'conan install ...'

       NOTE: default we call 'conan install' with no --update, your can adding --update as follows
            CONAN_INSTALL_PARAMS = "--update"
            include($$(CONAN_QT_QMAKE_HOME)/conan.pri)


    2, call conanBasicSetup.pri, witch calls 'conanbuildinfo.pri' and setup script.


    3, call conanDeploySetup.pri, witch parce conan_libs, and then add conan libs to INSTALLS target. Then with 'cmake install', we copy conan libs to our dest dir.

       NOTE: Default we ignore this script, only triggered when 'CONAN_ENABLE_DEPLOY = true' set before calling conan.pri. 
            CONAN_ENABLE_DEPLOY = true
            include($$(CONAN_QT_QMAKE_HOME)/conan.pri)

       NOTE: Default dest dir is $$DESTDIR. If it is empty, $$OUT_PWD would be used. And if debug_and_release set, $$OUT_PWD/debug or $$OUT_PWD/release would be used.


# TODO

    1, Bug fix
    2, More flexibility usage



# Author
    Fish, mail: 790105840@qq.com