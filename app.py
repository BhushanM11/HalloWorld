from flask import Flask, request
from flask_cors import CORS
import requests
from requests.auth import HTTPBasicAuth

app = Flask(__name__)
CORS(app)

@app.route('/')
def index():
 return app.send_static_file('index.html')




if __name__ == '__main__':
    app.run(debug=True)