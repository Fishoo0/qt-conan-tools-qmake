# install conan libs
# if you want "conan install --update", specify CONAN_INSTALL_UPDATE = true in your calling pro

!build_pass {

    win32 {
        message("conanInstall ...")
        CONFIG(release, debug|release) {
            CONAN_BUILD_TYPE = Release
        } else {
            CONAN_BUILD_TYPE = Debug
        }
        contains(QT_ARCH, i386) {
           CONAN_ARCH = x86
        } else {
           CONAN_ARCH = x86_64
        }
        conan_install_cmd_update = ""
        equals(CONAN_INSTALL_UPDATE, true) {
            conan_install_cmd_update = "--update"
        }
        CONAN_QT_VERSION = $$[QT_VERSION]
        conan_install_cmd =  "conan install $$_PRO_FILE_PWD_ -s build_type=$$CONAN_BUILD_TYPE -s arch=$$CONAN_ARCH -s arch_build=$$CONAN_ARCH -o *:qt_version=$$CONAN_QT_VERSION -if $$shadowed($$_PRO_FILE_PWD_) $$conan_install_cmd_update"
        message($$conan_install_cmd)
        system($$conan_install_cmd)
    }
}

# optional: Convenient configure for QtCreator displaying conan file list
DISTFILES += \
    $$PWD/conanInstall.pri \
    $$shadowed($$_PRO_FILE_PWD_)/conaninfo.txt \
    $$shadowed($$_PRO_FILE_PWD_)/graph_info.json \
    $$shadowed($$_PRO_FILE_PWD_)/conanbuildinfo.txt \
    $$shadowed($$_PRO_FILE_PWD_)/conanbuildinfo.pri

