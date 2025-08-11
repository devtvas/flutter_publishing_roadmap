#!/usr/bin/env bash
set -e

echo ">> Instalando MkDocs + plugins"
python3 -m pip install --upgrade pip mkdocs mkdocs-material mike

echo ">> Servindo docs em http://127.0.0.1:8000"
mkdocs serve