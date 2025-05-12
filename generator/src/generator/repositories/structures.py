import os
import json

def save(root_path, item, data):
    structure_path = f"{root_path}/api/data/{item.id}.json"

    os.makedirs(os.path.dirname(structure_path), exist_ok=True)

    with open(structure_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=4)
