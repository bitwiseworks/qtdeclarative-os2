TARGET = qmldbg_quickprofiler
os2:TARGET_SHORT = qmldqp
QT    += qml-private quick-private core-private packetprotocol-private

PLUGIN_TYPE = qmltooling
PLUGIN_CLASS_NAME = QQuickProfilerAdapterFactory
load(qt_plugin)

SOURCES += \
    $$PWD/qquickprofileradapter.cpp \
    $$PWD/qquickprofileradapterfactory.cpp

HEADERS += \
    $$PWD/qquickprofileradapter.h \
    $$PWD/qquickprofileradapterfactory.h \

OTHER_FILES += \
    qquickprofileradapter.json
