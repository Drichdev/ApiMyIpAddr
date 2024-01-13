import socket
from flask import Flask, jsonify
from flask_cors import CORS

def get_ip_address():
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(("8.8.8.8", 80))  # Connect to a reference IP address (Google's DNS server)
        ip_address = s.getsockname()[0]  # Get the local IP address
        s.close()
        return ip_address
    except socket.error as e:
        print(f"Error retrieving IP address: {e}")
        return None


app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

@app.route('/get_ip', methods=['GET'])
def get_ip():
    try:
        # Replace 'get_ip_address()' with your actual method to retrieve the IP address
        ip_address = get_ip_address()
        return jsonify({'ip_address': ip_address})
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
