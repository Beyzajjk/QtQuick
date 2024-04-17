#ifndef INFORMATION_H
#define INFORMATION_H

#include <QObject>
#include <QQuickView>

class Information : public QObject
{
    Q_OBJECT

public:
    explicit Information(QObject *parent = nullptr); //

public slots:
    void openInformationPage(); // Slot baglantisi
private:
    QQuickView m_dialog; // QQuickView  nesnesi
};

#endif // INFORMATION_H
