from fastapi import FastAPI, Depends
import os
import psycopg2
from typing import Optional

app = FastAPI(title="AWS Infra Bootstrap API")

# Database connection helper
def get_db_connection():
    try:
        conn = psycopg2.connect(
            host=os.getenv("DB_HOST"),
            database=os.getenv("DB_NAME"),
            user=os.getenv("DB_USER"),
            password=os.getenv("DB_PASSWORD"),
            port=os.getenv("DB_PORT", 5432)
        )
        return conn
    except Exception as e:
        print(f"Error connecting to database: {e}")
        return None

@app.get("/")
def read_root():
    return {
        "message": "Welcome to the AWS Infra Bootstrap API!",
        "status": "Healthy",
        "environment": os.getenv("ENVIRONMENT", "development")
    }

@app.get("/health")
def health_check():
    # Simple health check that also tests DB connectivity
    db_status = "Disconnected"
    conn = get_db_connection()
    if conn:
        db_status = "Connected"
        conn.close()
    
    return {
        "status": "UP",
        "database": db_status
    }

@app.get("/s3-info")
def s3_info():
    return {
        "bucket_name": os.getenv("S3_BUCKET_NAME", "Not Configured")
    }
