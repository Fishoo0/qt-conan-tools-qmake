REVISION = $$(CI_COMMIT_SHA)
isEmpty(REVISION) {
    REVISION = $$system("git -C $$_PRO_FILE_PWD_ rev-parse HEAD")
}
isEmpty(REVISION) {
    REVISION = Unknown
}
DEFINES += GIT_REVISION=\\\"$$REVISION\\\"

message(GIT_REVISION: $$REVISION)