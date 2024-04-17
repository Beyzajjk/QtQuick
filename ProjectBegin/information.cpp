#include "information.h"
#include <QQmlContext>

Information::Information(QObject *parent) : QObject(parent)
{
    // QML dosyasını tanımlamak için m_dialog nesnesini ayarliyor.
    m_dialog.setSource(QUrl("qrc:/Message1.qml"));
}

void Information::openInformationPage()
{
    //  m_dialog nesnesi.
    m_dialog.show();
}
