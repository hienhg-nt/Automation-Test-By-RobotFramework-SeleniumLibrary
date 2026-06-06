import json

def read_json(file_path, key=None):
    with open(file_path, encoding='utf-8') as f:
        data = json.load(f)

    if key:
        return data.get(key)
    return data