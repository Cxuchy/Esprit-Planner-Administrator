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

from PyQt5.QtCore import QRect, QPropertyAnimation, QParallelAnimationGroup



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
        db = ConnectDatabase()

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





        # hiding the frame for resolution message
        self.ui.resolution_message_frame.hide()
        self.ui.accept_btn.clicked.connect(self.acceptReq)
        self.ui.reject_btn.clicked.connect(self.declineReq)
        self.ui.resolve_btn.clicked.connect(self.openresolve)


        #closing widget
        self.ui.close_resolution_frame.clicked.connect(self.closeResolution)

        #filling the complaints table
        complaints = db.display_pending_complaints()
        print(complaints)
        self.ui.complaints_table.setRowCount(len(complaints))
        row = 0
        for entry in complaints:

            if entry["submissionDate"] is None:
                subDate = "NA"
            else :
                subDate = entry["submissionDate"].strftime('%Y-%m-%d')
            if entry["resolutionDate"] is None:
                resDate = "NA"
            else:
                resDate = entry["resolutionDate"].strftime('%Y-%m-%d')

            self.ui.complaints_table.setItem(row, 0, QTableWidgetItem(str(entry["id"])))
            self.ui.complaints_table.setItem(row, 1, QTableWidgetItem(subDate))
            self.ui.complaints_table.setItem(row, 2, QTableWidgetItem(str(entry["submitMessage"])))
            self.ui.complaints_table.setItem(row, 3, QTableWidgetItem(str(entry["status"])))
            self.ui.complaints_table.setItem(row, 4, QTableWidgetItem(resDate))
            self.ui.complaints_table.setItem(row, 5, QTableWidgetItem(str(entry["resolutionMessage"])))
            row += 1

        #Reading selected data from table
        self.ui.complaints_table.itemSelectionChanged.connect(self.item_selection_changed)



        self.ui.add_exam_btn.clicked.connect(self.openaddExam)
        self.ui.close_add_exam.clicked.connect(self.closeaddExam)


    def openaddExam(self):
        self.ui.calendarWidget.setGeometry(20, 10, 441, 211)
        self.ui.add_exam_btn.setGeometry(370, 240, 101, 29)
        self.ui.label_11.setGeometry(170, 260, 131, 51)
        self.ui.tableWidget.setGeometry(20, 310, 450, 111)
        self.ui.widget_4.setGeometry(380, 50, 491, 451)
    def closeaddExam(self):
        self.ui.widget_4.setGeometry(10, 50, 861, 451)

    def closeResolution(self):
        self.ui.resolution_message_frame.hide()

    def acceptReq(self):



        self.ui.resolution_message_frame.hide()

    def declineReq(self):




        self.ui.resolution_message_frame.hide()


    def openresolve(self):
        self.ui.resolution_message_frame.show()


    def item_selection_changed(self):
        selected_items = self.ui.complaints_table.selectedItems()

        if selected_items:
            # Get the row of the first selected item (assuming single row selection)
            selected_row = selected_items[0].row()

            # Get data for all columns in the selected row
            row_data = []
            for column in range(self.ui.complaints_table.columnCount()):
                item = self.ui.complaints_table.item(selected_row, column)
                if item:
                    row_data.append(item.text())
                else:
                    row_data.append("")
            print("Row data:", row_data)
            return row_data




       
    def calendarDateChanged(self):
        self.ui.tableWidget.clear()
        print("calendar date changed")
        dateSelected = self.ui.calendarWidget.selectedDate().toPyDate()
        self.ui.examdate_label.setText(dateSelected.strftime('%Y-%m-%d'))
        #print(dateSelected)
        db = ConnectDatabase()
        result = db.select_byDate(dateSelected.strftime('%Y-%m-%d'))
        #print('the result is', result)
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
        self.ui.widget_4.setGeometry(10, 50, 861, 451)
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
            database="espritexamplanner"
        )
        if db.is_connected():
            print("Successfully connected to the database")
        else:
            print("db not connected")

        cursor = db.cursor()
        cursor.execute("select * from users where email='"+ email +"' and password='"+ pw +"'")
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
            database="espritexamplanner"
        )
        if db.is_connected():
            print("Successfully connected to the database")
        else:
            print("db not connected")

        cursor = db.cursor()
        cursor.execute("select * from users where email='" + email + "' and password='" + pw + "'")
        result = cursor.fetchone()  # collected data

        if result:
            QMessageBox.information(self,"Information","User already existing")
        else:
            cursor.execute("insert into users(identifier,nom,email,password,phonenumber,role) values('"+ id +"','"+ name +"','"+ email +"','"+ pw +"','"+ phone_numb +"','"+ role +"')")
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



