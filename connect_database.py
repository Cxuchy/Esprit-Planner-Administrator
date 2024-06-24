import mysql.connector

class ConnectDatabase:
    def connect_db(self):
        self.con = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="espritplanner"
        )
        if self.con.is_connected():
            print("Successfully connected to the database")
        else:
            print("db not connected")

        #create a cursor for executing sql queries
        self.cursor = self.con.cursor(dictionary=True)



    def add_info(self,datepassage,heurepassage,nbprof_required):
        self.connect_db()

        sql = f"""INSERT INTO passageexam (datepassage,heurepassage,nbprof_required) VALUES ('{datepassage}','{heurepassage}','{nbprof_required}'); """
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
                    UPDATE passageexam
                        SET datepassage='{datepassage}', heurepassage='{heurepassage}', nbprof_required='{nbprof_required}'
                        WHERE passageExamID={passageExamID};
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
        sql = f"""SELECT * FROM passageexam;"""

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
        sql = f"""SELECT * FROM passageexam WHERE datepassage='{datepassage}';"""

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
        DELETE FROM passageexam WHERE passageExamID='{passageExamID}';
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


