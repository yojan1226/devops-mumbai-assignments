from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello from Flask in Docker..operated by honey"

if __name__ == "__main__":
    # bind to 0.0.0.0 so container is reachable from host
    app.run(host="0.0.0.0", port=5000, debug=True)
