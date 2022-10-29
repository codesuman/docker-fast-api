import os

from typing import Optional
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    print('GET Hello world')
    return {"Hello": "World"}


@app.get("/items/{item_id}")
def read_item(item_id: int):
    #https://stackoverflow.com/questions/4271740/how-can-i-use-python-to-get-the-system-hostname
    print('GET Items')
    return {"item_id": item_id * 2, "hostname": os.uname()[1]}
