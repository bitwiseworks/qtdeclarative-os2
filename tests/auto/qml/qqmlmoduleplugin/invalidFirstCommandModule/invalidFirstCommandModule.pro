TEMPLATE = lib
os2:TARGET_SHORT = invfcm
os2:CONFIG += target_short_symlink
CONFIG += plugin
SOURCES = plugin.cpp
QT = core qml
DESTDIR = ../imports/org/qtproject/InvalidFirstCommandModule

QT += core-private gui-private qml-private

IMPORT_FILES = \
        qmldir

include (../../../shared/imports.pri)
