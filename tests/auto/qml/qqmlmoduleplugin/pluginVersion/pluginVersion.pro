TEMPLATE = lib
os2:TARGET_SHORT = pver
os2:CONFIG += target_short_symlink
CONFIG += plugin
SOURCES = plugin.cpp
QT = core qml
DESTDIR = ../imports/org/qtproject/AutoTestQmlVersionPluginType

QT += core-private gui-private qml-private

IMPORT_FILES = \
        qmldir

include (../../../shared/imports.pri)
