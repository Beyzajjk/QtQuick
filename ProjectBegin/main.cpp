#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "cppclass.h"
#include "information.h"
#include <QQuickStyle>
#include "poll_organizer.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QQuickStyle::setStyle("Fusion");
    QGuiApplication app(argc, argv);
    Information information; // Class tanitimi
    CppClass cppClass;
    poll_organizer poll_organizer; // Poll Object
    QQmlApplicationEngine engine;
    qmlRegisterType<Information>("com.example", 1 , 0 , "Information");
    engine.rootContext()->setContextProperty("CppClass",&cppClass);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);
    engine.rootContext()->setContextProperty("poll_organizer", &poll_organizer);
    engine.rootContext()->setContextProperty("information", &information);  // QML nesnesine erisim

    return app.exec();
}
