# setup conan libs
CONFIG += conan_basic_setup
include($$shadowed($$_PRO_FILE_PWD_)/conanbuildinfo.pri)

equals(TEMPLATE, app) {
    CONFIG(release, debug|release) {
        targetConanBin.path = $$DESTDIR
    } else {
        targetConanBin.path = $$DESTDIR
    }
    !isEmpty(targetConanBin.path) {
        for(var, $$list($$CONAN_BINDIRS)) {
            targetConanBin.files += $$var/*
        }
        message("targetConanBin.path -> $$targetConanBin.path")
        message("targetConanBin.files -> $$targetConanBin.files")
        INSTALLS += targetConanBin
    }
}
