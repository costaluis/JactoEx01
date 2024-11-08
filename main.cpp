#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "CarregaArquivo.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    app.setApplicationName("Exercício 01");
    app.setOrganizationName("Luis Oliveira");

    qmlRegisterType<CarregaArquivo>("Cpp_Elements", 1, 0, "CarregaArquivo");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
