TEMPLATE = lib
TARGET = Imports
os2:TARGET_SHORT = Imprts # Avoid conflict with IMPORTS .DEF keyword
os2:CONFIG += target_short_symlink
QT += qml
CONFIG += qt plugin

CONFIG -= debug_and_release_target
!build_pass:qtConfig(debug_and_release): CONFIG += release

TARGET = $$qtLibraryTarget($$TARGET)
os2:TARGET_SHORT = $$qtLibraryTarget($$TARGET_SHORT)

SOURCES += \
    imports_plugin.cpp \
    imports.cpp

HEADERS += \
    imports_plugin.h \
    imports.h

!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    cp.files = qmldir plugins.qmltypes CompositeImports.qml
    cp.path = $$OUT_PWD
    COPIES += cp
}

