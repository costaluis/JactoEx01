#include "EnviaComando.h"

EnviaComando::EnviaComando(QObject *parent) : QObject(parent), Mensageiro(zmq::socket_type::pub, Mensageiro::transport_type::ipc) {
    EnviaComando::startConnection();
}

EnviaComando::~EnviaComando() {
    this->closeConnection();
}

void EnviaComando::startConnection() {
    _socket->bind(Mensageiro::_transport_header_map.at(this->_transport_type).data() + std::string("/tmp/0"));
}

void EnviaComando::sendMessage() {
    const std::string topic_string = _topic.toStdString();
    const std::string msg_string = _msg.toStdString();

    std::array<zmq::const_buffer,2> send_msgs = {
        zmq::const_buffer(topic_string.data(), topic_string.size()),
        zmq::const_buffer(msg_string.data(), msg_string.size())
    };

    zmq::send_multipart(*_socket, send_msgs);
}
