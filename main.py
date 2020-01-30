from config import mysql
from sqlalchemy import create_engine
import pandas as pd
import matplotlib.pyplot as plt

engine = create_engine(mysql['host'] + mysql['user'] + mysql['password'] + mysql['database'])
connection = engine.connect()
salaries = pd.read_sql("SELECT * FROM salaries", connection)
titles = pd.read_sql("SELECT * FROM titles", connection)

'''
plt.style.use('ggplot')
plt.hist(salaries.salary, bins=20)
plt.title('Common Salary Ranges for Employees')
plt.xlabel('Salaries')
plt.ylabel('Number')
plt.tight_layout()
plt.savefig('images/histogram.png', dpi=200)
'''

merged = pd.merge(titles, salaries, on='emp_no', how='left')
means = merged.groupby(title).mean()
print(means)
