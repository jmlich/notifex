#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "libwatchfish/notificationmonitor.h"
#include "libwatchfish/notification.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<watchfish::NotificationMonitor>("uk.co.piggz.amazfish", 1, 0, "NotificationMonitor");
    qmlRegisterType<watchfish::Notification>("uk.co.piggz.amazfish", 1, 0, "Notification");

    // watchfish::NotificationMonitor monitor;
    // QObject::connect(&monitor, &watchfish::NotificationMonitor::notification, [](watchfish::Notification *n) {
    //     qDebug() << "C++ slot fired! notification received" << n->appName() << n->summary() << n->body();
    // });
    // QObject::connect(&monitor, &watchfish::NotificationMonitor::notificationClosed, [](quint32 nid, quint32 reason) {
    //     qDebug() << "C++ slot fired! notification closed" << nid << reason;
    // });

    QQmlApplicationEngine engine;
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [](QObject *obj, const QUrl &objUrl) {
                         if (!obj) QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);

    engine.load(QUrl(QStringLiteral("qrc:/Main.qml")));

    return app.exec();
}
