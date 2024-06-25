import sys
from PyQt5 import QtWidgets
from PyQt5.QtWidgets import QDialog, QApplication, QMessageBox,QMainWindow, QApplication, QPushButton
from PyQt5.uic import loadUi
import mysql.connector as con
#from mainsidebar import MainWindow
from PyQt5.QtCore import pyqtSlot, QFile, QTextStream
import platform
from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtCore import (QCoreApplication, QPropertyAnimation, QDate, QDateTime, QMetaObject, QObject, QPoint, QRect, QSize, QTime, QUrl, Qt, QEvent)
from PyQt5.QtGui import (QBrush, QColor, QConicalGradient, QCursor, QFont, QFontDatabase, QIcon, QKeySequence, QLinearGradient, QPalette, QPainter, QPixmap, QRadialGradient)
from PyQt5.QtWidgets import *

import connect_database
# GUI FILE
from ui_main import Ui_MainWindow
from ui_functions import *
from connect_database import ConnectDatabase





class UIFunctions(QMainWindow):
    def toggleMenu(self, maxWidth, enable):
        if enable:
            # GET WIDTH
            width = self.ui.frame_left_menu.width()
            maxExtend = maxWidth
            standard = 100

            # SET MAX WIDTH
            if width == 100:
                widthExtended = maxExtend
            else:
                widthExtended = standard
            # ANIMATION
            self.animation = QPropertyAnimation(self.ui.frame_left_menu, b"minimumWidth")
            self.animation.setDuration(400)
            self.animation.setStartValue(width)
            self.animation.setEndValue(widthExtended)
            self.animation.setEasingCurve(QtCore.QEasingCurve.InOutQuart)
            self.animation.start()

class MainWindow(QMainWindow):    ########################################### Main Application Window Here #####################################################
    def __init__(self):
        QMainWindow.__init__(self)
        self.ui = Ui_MainWindow()
        self.ui.setupUi(self)

        ## TOGGLE/BURGUER MENU
        ########################################################################
        self.ui.Btn_Toggle.clicked.connect(lambda: UIFunctions.toggleMenu(self, 250, True))

        ## PAGES
        ########################################################################

        # PAGE 1
        self.ui.Btn_Menu_1.clicked.connect(lambda: self.ui.Pages_Widget.setCurrentWidget(self.ui.page_2))

        # PAGE 2
        self.ui.Btn_Menu_2.clicked.connect(lambda: self.ui.Pages_Widget.setCurrentWidget(self.ui.page_1))

        # PAGE 3
        self.ui.Btn_Menu_3.clicked.connect(lambda: self.ui.Pages_Widget.setCurrentWidget(self.ui.page_3))


        self.ui.Btn_Menu_4.clicked.connect(lambda: self.ui.Pages_Widget.setCurrentWidget(self.ui.page_4))



        #Calendar selection
        self.ui.calendarWidget.selectionChanged.connect(self.calendarDateChanged)

        self.ui.submit_btn.clicked.connect(self.addExamPassage)

        self.ui.tableWidget.setColumnWidth(0,120)
        self.ui.tableWidget.setColumnWidth(1,120)
        self.ui.tableWidget.setColumnWidth(2,150)






       
    def calendarDateChanged(self):
        self.ui.tableWidget.clear()
        print("calendar date changed")
        dateSelected = self.ui.calendarWidget.selectedDate().toPyDate()
        self.ui.examdate_label.setText(dateSelected.strftime('%Y-%m-%d'))
        print(dateSelected)
        db = ConnectDatabase()
        result = db.select_byDate(dateSelected.strftime('%Y-%m-%d'))
        print('the result is', result)
        # Extracting the values and converting the date to a string

        self.ui.tableWidget.setRowCount(len(result))
        row = 0
        for entry in result:
            self.ui.tableWidget.setItem(row,0,QTableWidgetItem(entry["datepassage"].strftime('%Y-%m-%d')))
            self.ui.tableWidget.setItem(row,1,QTableWidgetItem(str(entry["heurepassage"])))
            self.ui.tableWidget.setItem(row,2,QTableWidgetItem(str(entry["nbprof_required"])))
            row+=1


    def addExamPassage(self):
        dateExam = self.ui.calendarWidget.selectedDate().toPyDate()
        examStart = self.ui.hour_spinBox.text()
        nbSupervisors = self.ui.supervisors_spinBox.text()
        db = ConnectDatabase()
        db.add_info(dateExam, examStart, nbSupervisors)
        QMessageBox.information(self, "Data inserted", "Exam inserted into Database")



        ## SHOW ==> MAIN WINDOW
        ########################################################################
        self.show()
        ## ==> END ##

#Login Class
class LoginApp(QDialog):
    def __init__(self):
        super(LoginApp, self).__init__()
        loadUi("login-form.ui", self)

        #buttons and actions
        self.login_btn.clicked.connect(self.login)
        self.register_btn.clicked.connect(self.show_reg)

    def login(self):
        email = self.email_textfield.text()
        pw = self.password_textfield.text()

        #Connecting to DB
        db = con.connect(
            host="localhost",
            user="root",
            password="",
            database="espritplanner"
        )
        if db.is_connected():
            print("Successfully connected to the database")
        else:
            print("db not connected")

        cursor = db.cursor()
        cursor.execute("select * from user where email='"+ email +"' and password='"+ pw +"'")
        result = cursor.fetchone() # collected data

        #clearing text box
        self.password_textfield.setText("")
        self.email_textfield.setText("")


        if result:
            #QMessageBox.information(self,"Login Output","Access Granted")
            print("access granted")
            self.open_app()

        else:
            QMessageBox.information(self,"Login Output","Invalid User")
            print("access not granted")




    def show_reg(self):
        widget.setCurrentIndex(1)

    def open_app(self):
        widget.setCurrentIndex(2)






#Register Class
class RegApp(QDialog):
    def __init__(self):
        super(RegApp, self).__init__()
        loadUi("register-form.ui", self)
        self.register_btn.clicked.connect(self.reg)
        self.log_in_btn.clicked.connect(self.show_login)

    def reg(self):
        id = self.identifiant_field.text()
        pw = self.password_field.text()
        email = self.email_field.text()
        phone_numb = self.phonenumb_field.text()
        name = self.Name_field.text()
        role = "administrator"

        # Connecting to DB
        db = con.connect(
            host="localhost",
            user="root",
            password="",
            database="espritplanner"
        )
        if db.is_connected():
            print("Successfully connected to the database")
        else:
            print("db not connected")

        cursor = db.cursor()
        cursor.execute("select * from user where email='" + email + "' and password='" + pw + "'")
        result = cursor.fetchone()  # collected data

        if result:
            QMessageBox.information(self,"Information","User already existing")
        else:
            cursor.execute("insert into user(identifiant,nom,email,password,phonenumber,role) values('"+ id +"','"+ name +"','"+ email +"','"+ pw +"','"+ phone_numb +"','"+ role +"')")
            db.commit()
            QMessageBox.information(self,"Information","User Created , you can log in now")
            #clearing fields content after inserting
            self.identifiant_field.setText("")
            self.Name_field.setText("")
            self.phonenumb_field.setText("")
            self.email_field.setText("")
            self.password_field.setText("")

    def show_login(self):
        widget.setCurrentIndex(0)



if __name__ == "__main__":
    app = QApplication(sys.argv)
    widget = QtWidgets.QStackedWidget()
    loginform = LoginApp()
    registrationform = RegApp()
    mainwindowform = MainWindow()

    # main app
    widget.addWidget(loginform)
    widget.addWidget(registrationform)
    widget.addWidget(mainwindowform)

    widget.setCurrentIndex(0)
    widget.setFixedWidth(1000)
    widget.setFixedHeight(608)
    widget.show()

    app.exec_()



