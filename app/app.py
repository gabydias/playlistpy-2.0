from flask import Flask, jsonify, request
from flask_cors import CORS
from db import get_songs
import os 

app = Flask(__name__)
#cors = CORS(app, resources={r"/*": {"origins": "*"}})

@app.route('/')
def home():
    return jsonify({"status": "running", "service": "playlist-backend"})

@app.route('/api')
def songs():
    return get_songs()    

if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))
