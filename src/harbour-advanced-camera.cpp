#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif

#include <QQuickView>
#include <QGuiApplication>
#include <QQmlContext>
#include <QQmlEngine>
#include <QQuickItem>
#include <QSortFilterProxyModel>

#include "effectsmodel.h"
#include "exposuremodel.h"
#include "isomodel.h"
#include "resolutionmodel.h"
#include "wbmodel.h"
#include "focusmodel.h"
#include "flashmodel.h"
#include "fsoperations.h"
#include "resourcehandler.h"
#include "storagemodel.h"

int main(int argc, char *argv[])
{
    QGuiApplication *app = new QGuiApplication(argc, argv);
    app->setApplicationName("harbour_advanced_camera");

    qmlRegisterType<EffectsModel>("harbour_advanced_camera", 1, 0, "EffectsModel");
    qmlRegisterType<ExposureModel>("harbour_advanced_camera", 1, 0, "ExposureModel");
    qmlRegisterType<IsoModel>("harbour_advanced_camera", 1, 0, "IsoModel");
    qmlRegisterType<ResolutionModel>("harbour_advanced_camera", 1, 0, "ResolutionModel");
    qmlRegisterType<WbModel>("harbour_advanced_camera", 1, 0, "WhiteBalanceModel");
    qmlRegisterType<FocusModel>("harbour_advanced_camera", 1, 0, "FocusModel");
    qmlRegisterType<FlashModel>("harbour_advanced_camera", 1, 0, "FlashModel");

    ResolutionModel resolutionModel;
    QSortFilterProxyModel sortedResolutionModel;
    sortedResolutionModel.setSourceModel(&resolutionModel);
    sortedResolutionModel.setSortRole(ResolutionModel::ResolutionMpx);
    sortedResolutionModel.sort(0, Qt::DescendingOrder);

    QQuickView *view = new QQuickView();

    ResourceHandler handler;
    handler.acquire();

    view->engine()->addImportPath("../luneos-components/modules");
    view->engine()->addImportPath("../luneos-components/test/imports");

    view->rootContext()->setContextProperty("modelResolution", &resolutionModel);
    view->rootContext()->setContextProperty("sortedModelResolution", &sortedResolutionModel);
    StorageModel storageModel;
    view->rootContext()->setContextProperty("modelStorage", &storageModel);
    FSOperations fsOperations;
    view->rootContext()->setContextProperty("fsOperations", &fsOperations);

    view->setSource(QUrl::fromLocalFile(QCoreApplication::applicationDirPath() + "/qml/harbour-advanced-camera.qml"));

    QObject::connect(view, &QQuickView::focusObjectChanged, &handler,
                     &ResourceHandler::handleFocusChange);
    QObject::connect(&fsOperations, &FSOperations::rescan, &storageModel,
                     &StorageModel::scan);

    view->setResizeMode(QQuickView::SizeRootObjectToView);
    view->show();

    return app->exec();
}
