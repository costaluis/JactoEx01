#ifndef CARREGAARQUIVO_H
#define CARREGAARQUIVO_H

#include <QObject>
#include <QFile>
#include <QString>

class CarregaArquivo : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString fileText MEMBER _fileText NOTIFY textChanged)
public:
    CarregaArquivo(QObject *parent = nullptr);

    Q_INVOKABLE void readFile(QString fileName);
    Q_INVOKABLE void clear();
signals:
    void textChanged();

private:
    QFile _file;
    QString _fileText;
};

#endif // CARREGAARQUIVO_H
