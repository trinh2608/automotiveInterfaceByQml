#include "translation.h"
#include <QDebug>
Translation::Translation( QGuiApplication *app, QObject *parent): QObject(parent){
    m_app = app;
    translator= new QTranslator();
    m_currentLanguage = "us";
    translator->load("string_us",":/translator");
    m_app->installTranslator(translator);
}

QString Translation::updateText() const{
    return "";
}

QString Translation::currentLanguage(){
    return this->m_currentLanguage;
}

void Translation::setCurrentLanguage(QString language){
    qDebug() << language;
    m_currentLanguage = language;
    if(m_currentLanguage == "us"){
        translator->load("string_us",":/translator");
    }
    else{
        translator->load("string_vn",":/translator");
    }
    m_app->installTranslator(translator);
    emit languageChanged();
}

void Translation::selectLanguage(QString language){
    qDebug() << language;
    if(language == "us"){
        setCurrentLanguage("us");
    }
    else{
        setCurrentLanguage("vn");
    }
    emit languageChanged();

}
