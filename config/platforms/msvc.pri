QMAKE_CXXFLAGS += /utf-8

CONFIG(debug, debug|release) {
    TARGET = $$join(TARGET,,,d)
}

CONFIG(release, debug|release) {
    QMAKE_CXXFLAGS+=/Zi
    QMAKE_LFLAGS+= /INCREMENTAL:NO /Debug
}
