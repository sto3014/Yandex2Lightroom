#!/usr/bin/env bash
export PROJECT=yandex2lightroom
cd ~/Projekte/${PROJECT}-git
rm dist/*
python3 setup.py sdist bdist_wheel
# Install via wheel directly
pip install dist/${PROJECT}*.whl --force-reinstall
# Upload to testpypi
# python3 -m twine upload --repository testpypi dist/*
# Upload to pypi
python3 -m twine upload --repository pypi dist/*



