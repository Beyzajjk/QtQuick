#ifndef POLL_ORGANIZER_H
#define POLL_ORGANIZER_H


#include <QObject>

class poll_organizer : public QObject
{
    Q_OBJECT

public:
    explicit poll_organizer(QObject *parent = nullptr);


public slots:
    void sendSelectedOption(QString optionText, QString questionText, int poll);
    void loginInformation(QString user_name, int age, QString country, QString gender);

};

#endif // POLL_ORGANIZER_H
