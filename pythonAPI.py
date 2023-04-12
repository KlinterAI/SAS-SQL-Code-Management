# This is the file used to create the API from the JSON file.
from flask import *
import json, time, pandas as pd

iot = 'KlinterAI/SAS-SQL-Code-Management/dataset/IoT.csv'
iotToken = 'KlinterAI/SAS-SQL-Code-Management/dataset/iot_token.csv'
iotMeta = 'KlinterAI/SAS-SQL-Code-Management/dataset/iot_metadata.csv'
iotCost = 'KlinterAI/SAS-SQL-Code-Management/dataset/iot_cost_code.csv'

app = Flask(__name__)


@app.route('/', methods=['GET'])
def resultPage():
    data = {'Page': 'Results', 'Resulting Message': 'Fully loaded the \'Results\' page.'}
    dumpData = json.dumps(data)

    return dumpData

df = pd.read_csv('KlinterAI/SAS-SQL-Code-Management/dataset/iot_token.csv')

def calcOpTime(df):
    # Convert the 'start_time' and 'end_time' columns to datetime objects
    id = df['id'] 
    df['TIMESTAMP'] = pd.to_datetime(df['TIMESTAMP'])
    timestamps_by_id = df.groupby('ID')['TIMESTAMP'].apply(list)

    print(timestamps_by_id)

iot_operational_time = calculate_operational_time()

print('IoT Devices Operational Time:', iot_operational_time)

def calcMatUse():
    pass # Having trouble finding the data for the materials to even find out the material usage.

@app.route('/user/', methods=['GET'])
def requestPage():
    userRequest = str(request.args.get('user'))
    data = {'Page': 'Results', 'Resulting Message': f'Fully loaded the \'Results\' page with user: {userRequest}.'}
    dumpData = json.dumps(data)

    return dumpData


if __name__ == '__main__':
    main()