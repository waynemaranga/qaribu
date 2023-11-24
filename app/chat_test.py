import os
from openai import AzureOpenAI

client = AzureOpenAI(
  api_key = "b8e6ac2cfda244dd848a823511255a0b", 
  azure_endpoint= "https://hackathonservice.openai.azure.com/",  
  api_version="2023-05-15"
)

response = client.chat.completions.create(
    model="gpt-35-turbo", # model = "deployment_name".
    messages=[
        {"role": "system", "content": "You are a json maker."}, # instructio to llm
        {"role": "user", "content": "show me simple json structure"}, # inputs, prompts themselves
        {"role": "assistant", "content": "Send in Greek"}, # the response, parses the response. give a good example
        # {"role": "user", "content": "Do other Azure AI services support this too?"} 
        # add more functionality here

    ]
)

# 

print(response.choices[0].message.content)