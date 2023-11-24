import os
from openai import AzureOpenAI
    
client = AzureOpenAI(
    api_key=os.getenv("AZURE_OPENAI_KEY"),  
    api_version="2023-10-01-preview",
    azure_endpoint = os.getenv("AZURE_OPENAI_ENDPOINT")
    )
    
deployment_name='gpt-35-turbo' #This will correspond to the custom name you chose for your deployment when you deployed a model. 
    
# Send a completion call to generate an answer
print('Sending a test completion job')
start_phrase = 'Write a tagline for an ice cream shop. '
response = client.completions.create(model=deployment_name, prompt=start_phrase, max_tokens=10)
print(response.choices[0].text)

'''
@everyone Here are the OpenAI service details:

Endpoint: https://hackathonservice.openai.azure.com/
Key: b8e6ac2cfda244dd848a823511255a0b

Deployment Name: gpt-35-turbo
Deployment Name: ada-002
'''