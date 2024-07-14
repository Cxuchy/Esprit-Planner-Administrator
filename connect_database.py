import mysql.connector
from datetime import datetime

class ConnectDatabase:
    def connect_db(self):
        self.con = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="espritexamplanner"
        )
        if self.con.is_connected():
            print("Successfully connected to the database")
        else:
            print("db not connected")

        #create a cursor for executing sql queries
        self.cursor = self.con.cursor(dictionary=True)



    def add_info(self,datepassage,heurepassage,nbprof_required):
        self.connect_db()

        sql = f"""INSERT INTO passageexams (datepassage,heurepassage,nbprof_required) VALUES ('{datepassage}','{heurepassage}','{nbprof_required}'); """
        try:
            self.cursor.execute(sql)
            self.con.commit()
        except Exception as e:
            self.con.rollback()
            return e
        finally:
            self.con.close()




    def update_info(self,passageExamID,datepassage,heurepassage,nbprof_required):
        self.connect_db()
        sql = f"""
                    UPDATE passageexams
                        SET datepassage='{datepassage}', heurepassage='{heurepassage}', nbprof_required='{nbprof_required}'
                        WHERE id={passageExamID};
                """
        try:
            self.cursor.execute(sql)
            self.con.commit()
        except Exception as e:
            self.con.rollback()
            return e
        finally:
            self.con.close()



    def display_all(self):
        self.connect_db()
        sql = f"""SELECT * FROM passageexams;"""

        try:
            self.cursor.execute(sql)
            result = self.cursor.fetchall()
            return result
        except Exception as e:
            self.con.rollback()
            return e
        finally:
            self.con.close()

    def select_byDate(self,datepassage):
        self.connect_db()
        sql = f"""SELECT * FROM passageexams WHERE datepassage='{datepassage}';"""

        try:
            self.cursor.execute(sql)
            result = self.cursor.fetchall()
            return result
        except Exception as e:
            self.con.rollback()
            return e
        finally:
            self.con.close()


    def delete_info(self,passageExamID):
        self.connect_db()
        sql = """
        DELETE FROM passageexams WHERE id='{passageExamID}';
        """
        try:
            # Execute the SQL query for deleting information
            self.cursor.execute(sql)
            self.con.commit()

        except Exception as E:
            # Rollback the transaction in case of an error
            self.con.rollback()
            return E

        finally:
            # Close the database connection
            self.con.close()




#####################COMPLAINTS###################################
    def display_pending_complaints(self):
        self.connect_db()
        sql = f"""SELECT * FROM reclamations WHERE status = 'pending';"""

        try:
            self.cursor.execute(sql)
            result = self.cursor.fetchall()
            return result
        except Exception as e:
            self.con.rollback()
            return e
        finally:
            self.con.close()

    def accept_complaint(self,reclamationID,resolutionMessage):
        self.connect_db()
        sql = f"""
                            UPDATE reclamations
                            SET status='accepted', resolutionMessage='{resolutionMessage}', resolutionDate='{datetime.now().strftime("%Y-%m-%d")}'
                            WHERE id={reclamationID};
                        """
        try:
            self.cursor.execute(sql)
            self.con.commit()
        except Exception as e:
            self.con.rollback()
            return e
        finally:
            self.con.close()
    def reject_complaint(self,reclamationID,resolutionMessage):
        self.connect_db()
        sql = f"""
                            UPDATE reclamations
                            SET status='rejected', resolutionMessage='{resolutionMessage}', resolutionDate='{datetime.now().strftime("%Y-%m-%d")}'
                            WHERE id={reclamationID};
                        """
        try:
            self.cursor.execute(sql)
            self.con.commit()
        except Exception as e:
            self.con.rollback()
            return e
        finally:
            self.con.close()



    def display_professors(self):
        self.connect_db()
        sql = f"""SELECT * FROM users WHERE role = 'Professor';"""

        try:
            self.cursor.execute(sql)
            result = self.cursor.fetchall()
            return result
        except Exception as e:
            self.con.rollback()
            return e
        finally:
            self.con.close()

    def get_specific_professor(self,professor_name):
        self.connect_db()
        sql = f"""SELECT * FROM users WHERE role = 'Professor' and nom = '{professor_name}';"""
        try:
            self.cursor.execute(sql)
            result = self.cursor.fetchall()
            return result
        except Exception as e:
            self.con.rollback()
            return e
        finally:
            self.con.close()


    def get_prof_id(self,prof_name):
        self.connect_db()
        sql = f"""SELECT id FROM users WHERE nom = '{prof_name}';"""
        try:
            self.cursor.execute(sql)
            result = self.cursor.fetchall()
            return result
        except Exception as e:
            self.con.rollback()
            return e
        finally:
            self.con.close()


    def get_final_planning(self,professor_id):
        self.connect_db()
        sql = f"""SELECT * FROM requests r join passageexams p on r.passageexamid = p.id  WHERE status = 'accepted' and userid = '{professor_id}';"""
        try:
            self.cursor.execute(sql)
            result = self.cursor.fetchall()
            return result
        except Exception as e:
            self.con.rollback()
            return e
        finally:
            self.con.close()



