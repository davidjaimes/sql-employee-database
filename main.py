from config import mysql
from sqlalchemy import create_engine
engine = create_engine(mysql['host'] + mysql['user'] + mysql['password'] + mysql['database'])
#connection = engine.connect()
