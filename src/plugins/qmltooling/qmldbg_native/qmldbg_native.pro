TARGET = qmldbg_native
os2:TARGET_SHORT = qmldn
QT = qml-private core-private packetprotocol-private

HEADERS += \
    $$PWD/qqmlnativedebugconnector.h

SOURCES += \
    $$PWD/qqmlnativedebugconnector.cpp

OTHER_FILES += \
    $$PWD/qqmlnativedebugconnector.json

PLUGIN_TYPE = qmltooling
PLUGIN_CLASS_NAME = QQmlNativeDebugConnectorFactory
load(qt_plugin)
