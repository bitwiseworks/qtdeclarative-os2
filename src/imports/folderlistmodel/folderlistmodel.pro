CXX_MODULE = qml
TARGET  = qmlfolderlistmodelplugin
os2:TARGET_SHORT = qmlflmp
TARGETPATH = Qt/labs/folderlistmodel
IMPORT_VERSION = 2.$$QT_MINOR_VERSION

QT = core-private qml-private

SOURCES += qquickfolderlistmodel.cpp plugin.cpp \
    fileinfothread.cpp
HEADERS += qquickfolderlistmodel.h \
    fileproperty_p.h \
    fileinfothread_p.h

CONFIG += qmltypes install_qmltypes
load(qml_plugin)
