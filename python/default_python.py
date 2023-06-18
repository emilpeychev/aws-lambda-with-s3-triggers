import json

def lambda_handler(event, context):
    # Process the incoming event
    print(event)  # Print the event data for debugging purposes

    if 'Name' in event.get('queryStringParameters', {}):
        responseMessage = 'Hello, {}!'.format(event['queryStringParameters']['Name'])
    else:
        responseMessage = 'Hello from Lambda!'

    if event.get('httpMethod') == 'POST':
        body = json.loads(event['body'])
        responseMessage = 'Hello, {}!'.format(body['name'])

    # Example response
    response = {
        'statusCode': 200,
        'body': responseMessage
    }
    return response
