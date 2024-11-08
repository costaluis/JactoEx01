#include "EnviaComando.h"

EnviaComando::EnviaComando(QObject *parent) : QObject(parent), Mensageiro(zmq::socket_type::pub, Mensageiro::transport_type::ipc) {
    EnviaComando::startConnection();
}

EnviaComando::~EnviaComando() {
    this->closeConnection();
}

void EnviaComando::startConnection() {
    _socket->connect(Mensageiro::_transport_header_map.at(this->_transport_type).data() + std::string("/tmp/0"));
}

void EnviaComando::sendMessage() {
    _socket->send(zmq::message_t{_topic}, zmq::send_flags::sndmore);
    _socket->send(zmq::message_t{_msg}, zmq::send_flags::none);
}
