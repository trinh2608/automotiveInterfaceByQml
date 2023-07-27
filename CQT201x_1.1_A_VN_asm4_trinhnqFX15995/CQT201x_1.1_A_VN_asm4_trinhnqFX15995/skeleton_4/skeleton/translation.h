#ifndef TRANSLATION_H
#define TRANSLATION_H
#include <QObject>
#include <QTranslator>
#include <QGuiApplication>

class Translation : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString updateText READ updateText NOTIFY languageChanged)

public:
    Translation( QGuiApplication *app, QObject *parent = nullptr); // ham khoi tao
    QString updateText() const;
    QString currentLanguage(); // ham tra ve language hien tai ( String)
    void setCurrentLanguage(QString language);
    Q_INVOKABLE void selectLanguage(QString language);

signals:
    void languageChanged();
private:
    QTranslator *translator;
    QGuiApplication *m_app;
    QString m_currentLanguage;
    QString m_updateText;
};

#endif // TRANSLATION_H
