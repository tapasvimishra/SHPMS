from flask import Flask, render_template
import serial

app = Flask(__name__)

def process_data(data):
    ldr_reading, moisture_reading = map(int, data.decode('utf-8').strip().split(':'))
    
    if moisture_reading < 14000 and ldr_reading < 130:
        return "All vitals are normal (Mode 1)"
    elif moisture_reading > 14000 and ldr_reading > 130:
        return "Water motor is on, move plant to a better lighting condition (Mode 2)"
    elif moisture_reading > 14000 and ldr_reading < 130:
        return "Water motor is on, plant receiving optimal sunlight (Mode 3)"
    elif moisture_reading < 14000 and ldr_reading > 130:
        return "Plant receiving optimal hydration, move plant to a better lighting condition (Mode 4)"
    else:
        return "Error fetching Data"

def read_serial_data():
    SerialObj = serial.Serial('COM3', 2000000)
    try:
        data = SerialObj.readline()
        if data:
            return process_data(data)
        else:
            return "No data available"
    except Exception as e:
        return f"Error reading serial data: {e}"
    finally:
        SerialObj.close()

@app.route('/')
def index():
    alert_text = read_serial_data()
    return render_template('index.html', alert_text=alert_text)

if __name__ == '__main__':
    app.run(debug=True)
