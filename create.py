import sqlite3
import random
import string
import pandas as pd

data = pd.read_csv('Sales.csv')
# Connect to SQLite database (creates it if it doesn't exist)
conn = sqlite3.connect('Sales_record.db')
cursor = conn.cursor()

# Create a sample table
cursor.execute('''
CREATE TABLE IF NOT EXISTS Sales (
    Region VARCHAR(255) NOT NULL,
    Country VARCHAR(255) NOT NULL,
    Sold FLOAT NOT NULL,
    Price FLOAT NOT NULL,
    Cost FLOAT NOT NULL,                                            
	Profit FLOAT NOT NULL 
);
''')

# Insert data from CSV into the database
data.to_sql('Sales', conn, if_exists='append', index=False)

# Commit and close the connection
conn.commit()
conn.close()