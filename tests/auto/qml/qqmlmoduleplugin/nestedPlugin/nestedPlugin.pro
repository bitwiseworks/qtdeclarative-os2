TEMPLATE = lib
os2:TARGET_SHORT = nestp
os2:CONFIG += target_short_symlink
CONFIG += nestedPlugin
SOURCES = nestedPlugin.cpp
QT = core qml
DESTDIR = ../imports/org/qtproject/AutoTestQmlNestedPluginType

QT += core-private gui-private qml-private

IMPORT_FILES = \
        qmldir

include (../../../shared/imports.pri)
