TEMPLATE = lib
os2:TARGET_SHORT = strctm
CONFIG += plugin
SOURCES = plugin.cpp
QT = core qml
DESTDIR = ../imports/org/qtproject/StrictModule

QT += core-private gui-private qml-private

IMPORT_FILES = \
        qmldir

include (../../../shared/imports.pri)
