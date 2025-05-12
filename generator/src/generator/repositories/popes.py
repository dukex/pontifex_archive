import os
from ..providers.api import Api

def all(root_path):
  api = Api(f"{root_path}/api")

  return api.popes()

def save(root_path, popes):
  api = Api(f"{root_path}/api")
  api.save_popes(popes)
