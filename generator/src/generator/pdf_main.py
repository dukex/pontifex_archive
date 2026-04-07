import os
import sys
from .repositories import popes
from . import pdf


def main():
    root_path = f"{os.path.dirname(__file__)}/../../.."
    volume_id = None

    args = sys.argv[1:]
    if "--volume" in args:
        idx = args.index("--volume")
        if idx + 1 < len(args):
            volume_id = args[idx + 1]

    _popes = popes.all(root_path)
    pdf.create(root_path, _popes, volume_id=volume_id)
