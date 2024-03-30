# app.py
from flask import Flask, render_template, jsonify
import serial

app = Flask(__name__)

SerialObj = serial.Serial('COM3', 2000000)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/data')
def get_data():
    try:
        data = SerialObj.readline().decode('utf-8').strip()
        ldr_reading, moisture_reading = map(int, data.split(':'))
        return jsonify({
            'moisture_reading': moisture_reading,
            'ldr_reading': ldr_reading
        })
    except Exception as e:
        return jsonify({'error': str(e)})

if __name__ == '__main__':
    app.run(debug=True)
