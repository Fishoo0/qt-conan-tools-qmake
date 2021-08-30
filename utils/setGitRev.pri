REV = $$(CI_COMMIT_SHA)
isEmpty(REV) {
    REV = $$system("git -C $$_PRO_FILE_PWD_ rev-parse HEAD")
}
isEmpty(REV) {
    REV = Unknown
}
DEFINES += GIT_REV=\\\"$$REV\\\"

message(GIT_REV: $$REV)