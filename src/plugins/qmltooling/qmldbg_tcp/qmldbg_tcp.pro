TARGET = qmldbg_tcp
os2:TARGET_SHORT = qmldt
QT = qml-private network

SOURCES += \
    $$PWD/qtcpserverconnection.cpp

HEADERS += \
    $$PWD/qtcpserverconnectionfactory.h

OTHER_FILES += \
    $$PWD/qtcpserverconnection.json

PLUGIN_TYPE = qmltooling
PLUGIN_CLASS_NAME = QTcpServerConnectionFactory
load(qt_plugin)
