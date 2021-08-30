# setup conan libs
message("conanBasicSetup")

CONFIG += conan_basic_setup
include($$OUT_PWD/conanbuildinfo.pri)


DISTFILES += \
    $$PWD/conanBasicSetup.pri \