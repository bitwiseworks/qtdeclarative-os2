TEMPLATE = lib
os2:TARGET_SHORT = pmix
os2:CONFIG += target_short_symlink
CONFIG += plugin
SOURCES = plugin.cpp
QT = core qml
DESTDIR = ../imports/org/qtproject/AutoTestQmlMixedPluginType

QT += core-private gui-private qml-private

IMPORT_FILES = \
        Foo.qml \
        qmldir

include (../../../shared/imports.pri)
