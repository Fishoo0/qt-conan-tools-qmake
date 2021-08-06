# install conan libs
include(conanInstall.pri)
include(conanBasicSetup.pri)
equals(CONAN_ENABLE_DEPLOY, true) {
    include(conanDeploySetup.pri)
}

# optional: Convenient configure for QtCreator displaying conan file list
DISTFILES += \
    $$PWD/conan.pri \
    $$_PRO_FILE_PWD_/conanfile.txt \

