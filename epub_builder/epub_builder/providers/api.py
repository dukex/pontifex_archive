import json
from types import SimpleNamespace

class Api:
  def __init__(self, api_base_path):
    self.base_path = api_base_path

  def popes(self):
    return self.__get(f"popes.json")

  def __get(self, resource):
    with open(f"{self.base_path}/{resource}") as text:
      data = json.load(text, object_hook=lambda d: SimpleNamespace(**d))
      text.close()
      return data
