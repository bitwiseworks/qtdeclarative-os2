TEMPLATE = lib
os2:TARGET_SHORT = chldp
os2:CONFIG += target_short_symlink
CONFIG += childplugin
SOURCES = childplugin.cpp
QT = core qml
DESTDIR = ../../imports/org/qtproject/AutoTestQmlPluginType/ChildPlugin

QT += core-private gui-private qml-private

IMPORT_FILES = \
        qmldir

include (../../../../shared/imports.pri)
