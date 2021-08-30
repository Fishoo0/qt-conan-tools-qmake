# install conan libs

# $$shadowed($$_PRO_FILE_PWD_) is same as $$OUT_PWD
# params1: the relavant dir of conanfile.txt
defineTest(conanInstall) {
    message("conanInstall")
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
            CONAN_QT_VERSION = $$[QT_VERSION]
            isEmpty(1) {
                conanfile = $$_PRO_FILE_PWD_
            } else {
                conanfile = $$_PRO_FILE_PWD_/$$1
            }
            conan_install_cmd =  "conan install $$conanfile -s build_type=$$CONAN_BUILD_TYPE -s arch=$$CONAN_ARCH -s arch_build=$$CONAN_ARCH -o *:qt_version=$$CONAN_QT_VERSION -if $$OUT_PWD --update"
            message($$conan_install_cmd)
            system($$conan_install_cmd)
        }
    }
}


# optional: Convenient configure for QtCreator displaying conan file list
DISTFILES += \
    $$PWD/conanTools.pri \

