CXX_MODULE = qml
TARGET  = modelsplugin
os2:TARGET_SHORT = qmlmp
TARGETPATH = QtQml/Models.2
IMPORT_VERSION = 2.$$QT_MINOR_VERSION

SOURCES += \
    plugin.cpp

QT = qml-private

load(qml_plugin)
