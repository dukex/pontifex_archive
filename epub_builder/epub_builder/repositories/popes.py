import os
from ..providers.api import Api

__dirname = os.path.dirname(__file__)

def all():
  api = Api(f"{__dirname}/../../../api")

  return api.popes()