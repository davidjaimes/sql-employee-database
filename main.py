from config import mysql
from sqlalchemy import create_engine
import pandas as pd

engine = create_engine(mysql['host'] + mysql['user'] + mysql['password'] + mysql['database'])
connection = engine.connect()
data = pd.read_sql("SELECT * FROM employees", connection)
print(data)
