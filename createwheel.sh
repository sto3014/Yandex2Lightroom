#!/usr/bin/env bash
export PROJECT=yandex2lightroom
cd ~/Projekte/${PROJECT}-git || exit
rm dist/*
python3 setup.py sdist bdist_wheel

