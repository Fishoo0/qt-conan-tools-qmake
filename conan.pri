# install conan libs

include(conanInstall.pri)
include(conanBasicSetup.pri)
equals(TEMPLATE, app) {
    include(conanDeploySetup.pri)
}

# optional: Convenient configure for QtCreator displaying conan file list
DISTFILES += \
    $$PWD/conan.pri \

