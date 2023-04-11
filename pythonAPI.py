# This is the file used to create the API from the JSON file.
from flask import *
import json, time, pandas as pd

iot = pd.read_csv(r'KlinterAI/SAS-SQL-Code-Management/dataset/IoT.csv')
iotToken = pd.read_csv(r'KlinterAI/SAS-SQL-Code-Management/dataset/iot_token.csv')
iotMeta = pd.read_csv(r'KlinterAI/SAS-SQL-Code-Management/dataset/iot_metadata.csv')
iotCost = pd.read_csv(r'KlinterAI/SAS-SQL-Code-Management/dataset/iot_cost_code.csv')

app = Flask(__name__)


@app.route('/', methods=['GET'])
def resultPage():
    data = {'Page': 'Results', 'Resulting Message': 'Fully loaded the \'Results\' page.'}
    dumpData = json.dumps(data)

    return dumpData

def runCSV(iot, iotToken, iotMeta, iotCost):
    pass

@app.route('/user/', methods=['GET'])
def requestPage():
    userRequest = str(request.args.get('user'))
    data = {'Page': 'Results', 'Resulting Message': f'Fully loaded the \'Results\' page with user: {user}.'}
    dumpData = json.dumps(data)

    return dumpData



if __name__ == '__main__':
    main()