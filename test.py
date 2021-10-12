# -*- coding: utf-8 -*-
from app import app
import os
import unittest
import mysql.connector

class Test(unittest.TestCase):
    connection = None

    def setUp(self):
        # cria uma instância do unittest, precisa do nome "setUp"
        self.app = app.test_client()

        # envia uma requisicao GET para a URL
        self.result = self.app.get('/')

        db_user = os.environ.get('CLOUD_SQL_USERNAME')
        db_password = os.environ.get('CLOUD_SQL_PASSWORD')
        db_name = os.environ.get('CLOUD_SQL_DATABASE_NAME')
        db_local_host = os.environ.get('DB_LOCAL_HOST')
        self.connection = mysql.connector.connect(user=db_user, password=db_password, host=db_local_host, database=db_name)

    def tearDown(self):
        if self.connection is not None and self.connection.is_connected():
            self.connection.close()

    def test_connection(self):
        self.assertTrue(self.connection.is_connected())

    def test_requisicao(self):
        # compara o status da requisicao (precisa ser igual a 200)
        self.assertEqual(self.result.status_code, 200)

if __name__ == '__main__':
    unittest.main()
