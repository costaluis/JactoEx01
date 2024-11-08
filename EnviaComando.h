#ifndef ENVIACOMANDO_H
#define ENVIACOMANDO_H

#include <QObject>
#include <QString>

#include "Mensageiro.h"


class EnviaComando : public QObject, private Mensageiro
{
    Q_OBJECT
    Q_PROPERTY(QString topic MEMBER _topic)
    Q_PROPERTY(QString msg MEMBER _msg)
public:
    EnviaComando(QObject *parent = nullptr);
    ~EnviaComando();

    Q_INVOKABLE void sendMessage() override;


private:
    void  startConnection() override;
    QString _topic;
    QString _msg;
};

#endif // ENVIACOMANDO_H
