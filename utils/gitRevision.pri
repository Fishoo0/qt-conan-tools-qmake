REVISION = $$(CI_COMMIT_SHA)
isEmpty(REVISION) {
    REVISION = $$system("git rev-parse HEAD")
}
isEmpty(REVISION) {
    REVISION = Unknown
}
DEFINES += GIT_REVISION=\\\"$$REVISION\\\"