from flask import Flask
import redis
import os

app = Flask(__name__)

# Connect to Redis (default port 6379)
redis_host = os.getenv("REDIS_HOST", "localhost")
redis_port = int(os.getenv("REDIS_PORT", 6379))
redis_client = redis.Redis(host=redis_host, port=redis_port, db=0)

@app.route("/")
def index():
    # Increment a counter in Redis
    count = redis_client.incr("counter")
    return f"Hello! This page has been visited {count} times."

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
