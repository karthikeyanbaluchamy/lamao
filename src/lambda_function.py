import requests

def lambda_handler(event, context):
    # Example API request
    response = requests.get('https://jsonplaceholder.typicode.com/posts')
    
    return {
        'statusCode': 200,
        'body': response.json()
    }
