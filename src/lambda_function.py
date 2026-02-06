import requests

def lambda_handler(event, context):
    # Example API request
    for record in event['Records']:
        sns_message = record['Sns']['Message']
        print(f"Received message: {sns_message}")
    print("hello")
    response = requests.get('https://jsonplaceholder.typicode.com/posts')
    
    return {
        'statusCode': 200,
        'body': response.json()
    }
