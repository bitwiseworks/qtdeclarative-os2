CXX_MODULE = qml
TARGET  = workerscriptplugin
os2:TARGET_SHORT = wrksp
TARGETPATH = QtQml/WorkerScript.2
IMPORT_VERSION = 2.$$QT_MINOR_VERSION

SOURCES += \
    plugin.cpp

QT = qml-private qmlworkerscript-private

load(qml_plugin)
