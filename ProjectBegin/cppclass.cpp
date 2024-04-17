#include "cppclass.h"
#include <QDebug>

CppClass::CppClass(QObject *parent)
    : QObject{parent}
{

}

void CppClass::cppSlot()
{
    qDebug() << "C++ here, cppSlot called";
    emit sendDateTime(QDateTime::currentDateTime());
    emit sendTime(QTime::currentTime());
}

void CppClass::timeSlot(QTime time)
{
    qDebug () <<"Time from QML is : " << time;
}

void CppClass::dateTimeSlot(QDateTime datetime)
{
    qDebug () <<"Datetime from QML is : " << datetime;
}
