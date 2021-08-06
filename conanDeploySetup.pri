# setup conan libs
message("conanDeploySetup")

conan_deploy_dest_dir = ""
if:!isEmpty(DESTDIR) {
    conan_deploy_dest_dir = $$DESTDIR
} else {
    conan_deploy_dest_dir = $$OUT_PWD
    contains(CONFIG, "debug_and_release") {
        CONFIG(release, debug|release) {
            conan_deploy_dest_dir = $$conan_deploy_dest_dir/release
        } else {
            conan_deploy_dest_dir = $$conan_deploy_dest_dir/debug
        }
    }
}
CONFIG(release, debug|release) {
    targetConanBin.path = $$conan_deploy_dest_dir
} else {
    targetConanBin.path = $$conan_deploy_dest_dir
}
!isEmpty(targetConanBin.path) {
    for(var, $$list($$CONAN_BINDIRS)) {
        targetConanBin.files += $$var/*
    }
    message("targetConanBin.path -> $$targetConanBin.path")
    message("targetConanBin.files -> $$targetConanBin.files")
    INSTALLS += targetConanBin
}

DISTFILES += \
    $$PWD/conanDeploySetup.pri \
