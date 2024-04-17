#include "poll_organizer.h"
#include <QDebug>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QFile>
#include <QDir> // Test amacli current path

poll_organizer::poll_organizer(QObject *parent) : QObject(parent) {}

void poll_organizer::loginInformation(QString user_name, int age, QString country, QString gender){

    qDebug() << "Name: " << user_name;
    qDebug() << "Age : " << age;
    qDebug() << "Country: " << country;
    qDebug() << "Gender : " << gender << "\n";

    QString fileName = "user_info.json"; //saves.json oldugu yer de bir user_info.json olacak
    QFile file(fileName);

    if (!file.open(QIODevice::WriteOnly)) {
        qWarning() << "Couldn't open file for writing:" << file.errorString();
        return;
    }

    QJsonObject jsonObject;
    jsonObject["name"] = user_name;
    jsonObject["age"] = age;
    jsonObject["country"] = country;
    jsonObject["gender"] = gender;


    QJsonDocument jsonDocument(jsonObject);
    file.write(jsonDocument.toJson());
    file.close();

}

void poll_organizer::sendSelectedOption(QString optionText, QString questionText, int poll) {
    qDebug() << "Poll ID " << poll; // Poll Numarasi, hangi anket oldugu / manuel olarak poll 2 'de 2 olarak geliyor
    qDebug() << "Question Text: " << optionText; // Dogrudan Hangi option secili oldugu
    qDebug() << "Selected Radio Button Text: " << questionText << "\n"; // Hangi Soru
    qDebug() << "Current working directory: " << QDir::currentPath(); // Bu test amacli directory view

    // Dosyanin var olup olmadigini kontrol ediyor ve okuma gerceklestiriyor
    QString fileName = "saves.json";
    QFile file(fileName);
    QJsonArray jsonArray;

    if (file.exists()) {
        if (file.open(QIODevice::ReadOnly)) {
            QJsonDocument doc = QJsonDocument::fromJson(file.readAll());
            jsonArray = doc.array();
            file.close();
        } else {
            qDebug() << "Error opening the file: " << file.errorString();
            return;
        }
    }

    // Poll numarasina gore section secimi
    QJsonObject sectionObject;
    for (int i = 0; i < jsonArray.size(); ++i) {
        QJsonObject obj = jsonArray[i].toObject();
        if (obj.contains("section_number") && obj["section_number"].toInt() == poll) {
            sectionObject = obj;
            break;
        }
    }

    // Eger Poll numarasi yoksa json dosyasin'da ekliyor
    if (sectionObject.isEmpty()) {
        sectionObject.insert("section_number", poll);
        sectionObject.insert("questions", QJsonArray());
        jsonArray.append(sectionObject);
    }

    //  section secilen option datasi question array'ina atiliyor
    QJsonArray questionsArray = sectionObject["questions"].toArray();
    QJsonObject selectedOptionObject;
    selectedOptionObject.insert("question", questionText);
    selectedOptionObject.insert("answer", optionText);
    questionsArray.append(selectedOptionObject);
    sectionObject.insert("questions", questionsArray);

    // Section kisminin update'i
    for (int i = 0; i < jsonArray.size(); ++i) {
        QJsonObject obj = jsonArray[i].toObject();
        if (obj.contains("section_number") && obj["section_number"].toInt() == poll) {
            jsonArray[i] = sectionObject;
            break;
        }
    }

    // Json array dokumanina donusturuluyor
    QJsonDocument doc(jsonArray);

    // Json Dosyasini save'le
    if (file.open(QIODevice::WriteOnly)) {
        file.write(doc.toJson());
        file.close();
    } else {
        qDebug() << "Error opening the file: " << file.errorString();
    }
}

/**
 *  Json Structure'i Bu sekilde calisiyor olup / saves.json dosyasi ornek C:\Users\username\Desktop\QML2\build-ProjectBegin-Desktop_Qt_5_15_2_MSVC2019_64bit-Debug
 *   Build/saves.json
 *  build klasorunde bulunuyor
 *  {
  "sections": [
    {
      "section_number": 1,
      "questions": [
        {
          "question": "What is your name?",
          "answer": "John"
        },
        {
          "question": "Where do you live?",
          "answer": "New York"
        },
        {
          "question": "What is your favorite color?",
          "answer": "Blue"
        }
      ]
    },
    {
      "section_number": 2,
      "questions": [
        {
          "question": "How old are you?",
          "answer": "30"
        },
        {
          "question": "What is your occupation?",
          "answer": "Engineer"
        },
        {
          "question": "Do you have any pets?",
          "answer": "Yes"
        }
      ]
    }
  ] **/
