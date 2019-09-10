TEMPLATE = lib
os2:TARGET_SHORT = pqmlf
os2:CONFIG += target_short_symlink
CONFIG += plugin
SOURCES = plugin.cpp
QT = core qml
DESTDIR = ../imports/org/qtproject/AutoTestPluginWithQmlFile

QT += core-private gui-private qml-private

IMPORT_FILES = \
        qmldir \
        MyQmlFile.qml

include (../../../shared/imports.pri)
