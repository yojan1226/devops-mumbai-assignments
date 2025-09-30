from flask import Flask, jsonify
import os
import mysql.connector

app = Flask(__name__)

# -------------------------------
# Read DB connection info from environment variables
# These are set in Kubernetes Deployment:
# DB_HOST      : MySQL service hostname (from Service)
# DB_NAME      : Database name (from ConfigMap)
# DB_USER      : Username (from Secret)
# DB_PASSWORD  : Password (from Secret)
# -------------------------------
DB_HOST = os.getenv("DB_HOST", "mysql-service.python-sql-demo.svc.cluster.local")
DB_NAME = os.getenv("DB_NAME", "studentdb")
DB_USER = os.getenv("DB_USER", "student")
DB_PASSWORD = os.getenv("DB_PASSWORD", "studentpass")

def get_db_connection():
    """Create and return a MySQL connection"""
    return mysql.connector.connect(
        host=DB_HOST,
        database=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD
    )

@app.route("/")
def show_students():
    """Fetch all students and return as JSON"""
    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)  # Use dictionary for easy JSON conversion
        cursor.execute("SELECT id, name, email FROM students;")
        students = cursor.fetchall()
        cursor.close()
        conn.close()
        return jsonify(students)  # Flask returns JSON response
    except mysql.connector.Error as err:
        return f"Error connecting to MySQL: {err}"

if __name__ == "__main__":
    # Run Flask app on port 5000
    app.run(host="0.0.0.0", port=5000)