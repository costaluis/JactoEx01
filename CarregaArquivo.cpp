#include "CarregaArquivo.h"

#include <string_view>

CarregaArquivo::CarregaArquivo(QObject *parent) : QObject(parent) {}

void CarregaArquivo::readFile(QString fileName) {
    // Romoves the file header from the file path
    constexpr std::string_view header("file://");
    if (fileName.startsWith(header.data())) {
        fileName.remove(0,header.size());
    }

    _file.setFileName(fileName);
    _file.open(QIODevice::ReadOnly | QIODevice::Text);

    _fileText = _file.readAll();

    _file.close();

    emit textChanged();
}

void CarregaArquivo::clear() {
    _fileText.clear();

    emit textChanged();
}
