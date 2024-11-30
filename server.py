from flask import Flask, request, jsonify
from flask_cors import CORS  # To allow cross-origin requests

app = Flask(__name__)
CORS(app)  # Enable CORS for all domains

@app.route('/trigger', methods=['POST'])
def trigger_alert():
    # Receive JSON data from the frontend
    data = request.get_json()
    lat = data.get('latitude')
    lng = data.get('longitude')
    
    # Print to console (for testing)
    print(f"Received location: Latitude {lat}, Longitude {lng}")
    
    # You can add logic to process the data or store it in a database here
    
    # Send a response back to frontend
    return jsonify({"status": "success", "message": "Location received and circle drawn"})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
