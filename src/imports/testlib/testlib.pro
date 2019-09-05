CXX_MODULE = qml
TARGET  = qmltestplugin
os2:TARGET_SHORT = qmltp
TARGETPATH = QtTest
IMPORT_VERSION = 1.$$QT_MINOR_VERSION

QT += qml quick qmltest qmltest-private  qml-private core-private testlib

SOURCES += main.cpp

QML_FILES = \
    TestCase.qml \
    SignalSpy.qml \
    testlogger.js

load(qml_plugin)

OTHER_FILES += testlib.json
