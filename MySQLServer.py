import mysql.connector 
from mysql.connector import Error 

connection = None # Initialize connection to None for safety

try:
    connection = mysql.connector.connect(
        host = "localhost",
        user = "root" ,       # CORRECTED: Changed 'users' to 'user'
        password = "14235134" # CORRECTED: Changed 'passwords' to 'password' and made it a string
    )
    
    # Check if the connection was successful before proceeding
    if connection.is_connected():
        cursor = connection.cursor()
        
        # Execute the SQL command to create the database
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store;")
        print("Database 'alx_book_store' created or already exists.")
    else:
        print("Failed to establish a connection to MySQL.")

except mysql.connector.Error as e:

    # This block catches errors like 'Access denied' or 'Unknown database'
    print(f"Error occurred: {e}")

finally:
    # The 'finally' block ensures cleanup happens, regardless of success or failure
    if connection is not None and connection.is_connected():
        # Check if the cursor exists before trying to close it
        if 'cursor' in locals() and cursor is not None:
             cursor.close()
        
        connection.close()
        print('MySQL connection closed.') 
