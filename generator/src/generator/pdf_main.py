import os
from .repositories import popes
from . import pdf


def main():
    root_path = f"{os.path.dirname(__file__)}/../../.."
    _popes = popes.all(root_path)
    pdf.create(root_path, _popes)
