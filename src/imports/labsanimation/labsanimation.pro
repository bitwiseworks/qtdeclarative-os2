CXX_MODULE = qml
TARGET  = labsanimationplugin
os2:TARGET_SHORT = lanip
TARGETPATH = Qt/labs/animation
IMPORT_VERSION = 1.0

SOURCES += \
    qquickboundaryrule.cpp \
    plugin.cpp

HEADERS += \
    qquickboundaryrule_p.h

QT = qml-private quick-private

CONFIG += qmltypes install_qmltypes
load(qml_plugin)
