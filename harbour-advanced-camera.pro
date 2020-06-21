# The name of your application
TARGET = harbour-advanced-camera

QT += multimedia quick

SOURCES += src/harbour-advanced-camera.cpp \
    src/effectsmodel.cpp \
    src/exposuremodel.cpp \
    src/isomodel.cpp \
    src/resolutionmodel.cpp \
    src/wbmodel.cpp \
    src/focusmodel.cpp \
    src/flashmodel.cpp \
    src/fsoperations.cpp \
    src/resourcehandler.cpp \
    src/storagemodel.cpp

DISTFILES += translations/*.ts 
    
QML_FILES += qml/harbour-advanced-camera.qml \
    qml/components/*.qml \
    qml/pages/*.qml


# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/harbour-advanced-camera-de.ts \
                translations/harbour-advanced-camera-es.ts \
                translations/harbour-advanced-camera-fi.ts \
                translations/harbour-advanced-camera-fr.ts \
                translations/harbour-advanced-camera-sv.ts \
                translations/harbour-advanced-camera-zh_CN.ts

HEADERS += \
    src/effectsmodel.h \
    src/exposuremodel.h \
    src/isomodel.h \
    src/resolutionmodel.h \
    src/wbmodel.h \
    src/focusmodel.h \
    src/flashmodel.h \
    src/fsoperations.h \
    src/resourcehandler.h \
    src/storagemodel.h

RUNTIME_FILES = appinfo.json \
                harbour-advanced-camera.png

OTHER_FILES += $$QML_FILES $$RUNTIME_FILES

LIBS += -ldl

# Deployment
qml_files.path = $$DEPLOYMENT_PATH
qml_files.files = qml

runtime_files.path = $$DEPLOYMENT_PATH
runtime_files.files = $$RUNTIME_FILES

target.path = $$DEPLOYMENT_PATH

INSTALLS += qml_files runtime_files target
