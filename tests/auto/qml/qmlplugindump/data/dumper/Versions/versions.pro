TEMPLATE = lib
TARGET = Versions
os2:TARGET_SHORT = Vers
os2:CONFIG += target_short_symlink
QT += qml
CONFIG += qt plugin

CONFIG -= debug_and_release_target
!build_pass:qtConfig(debug_and_release): CONFIG += release

TARGET = $$qtLibraryTarget($$TARGET)
os2:TARGET_SHORT = $$qtLibraryTarget($$TARGET_SHORT)

SOURCES += \
    versions_plugin.cpp \
    versions.cpp

HEADERS += \
    versions_plugin.h \
    versions.h

!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    cpqmldir.files = qmldir plugins.qmltypes
    cpqmldir.path = $$OUT_PWD
    COPIES += cpqmldir
}
