CXX_MODULE = qml
TARGET  = labsmodelsplugin
os2:TARGET_SHORT = qmllmp
TARGETPATH = Qt/labs/qmlmodels
IMPORT_VERSION = 1.0

SOURCES += \
    plugin.cpp

QT = qml-private

load(qml_plugin)
