TARGET = qmldbg_server
os2:TARGET_SHORT = qmlds
QT = qml-private packetprotocol-private

SOURCES += \
    $$PWD/qqmldebugserver.cpp

HEADERS += \
    $$PWD/qqmldebugserverfactory.h

OTHER_FILES += \
    qqmldebugserver.json

PLUGIN_TYPE = qmltooling
PLUGIN_CLASS_NAME = QQmlDebugServerFactory
load(qt_plugin)
