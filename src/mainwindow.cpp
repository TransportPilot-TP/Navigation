#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QQuickItem>


MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    QMainWindow::showFullScreen();
    ui->quickWidget->setSource(QUrl(QStringLiteral("qrc:/Map.qml")));
    ui->quickWidget->show();

    auto obj = ui->quickWidget->rootObject();
    connect(this, SIGNAL(setCenter(QVariant, QVariant)), obj, SLOT(setCenter(QVariant, QVariant)));
    emit setCenter(53.371226682986006, 55.935366213512054);
}

MainWindow::~MainWindow()
{
    delete ui;
}

