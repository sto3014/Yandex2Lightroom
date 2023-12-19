#!/usr/bin/env bash
export PROJECT=yandex2lightroom
cd ~/Projekte/${PROJECT} || exit
rm dist/*
python3.11 setup.py sdist bdist_wheel

