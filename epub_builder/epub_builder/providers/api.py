import json
from types import SimpleNamespace

class Api:
    def __init__(self, api_base_path):
        self.base_path = api_base_path

    def popes(self):
        return self.__get(f"popes.json")

    def save_popes(self, data):
        self.__set("popes.json", data)

    def __set(self, path, data):
        with open(f"{self.base_path}/{path}", 'w', encoding='utf-8') as f:
                json.dump(data, f, ensure_ascii=False, indent=4, default=get_obj_dict)

    def __get(self, resource):
        with open(f"{self.base_path}/{resource}") as text:
            data = json.load(text, object_hook=lambda d: SimpleNamespace(**d))
            text.close()
            return data

def get_obj_dict(obj):
    return obj.__dict__



