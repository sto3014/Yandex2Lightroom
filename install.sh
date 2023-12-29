#!/usr/bin/env bash
# python3 -m pip install --index-url https://test.pypi.org/simple/ your-package
#
# as venv is activated we must reset PATH
echo current python is: `which python`
export PATH=`echo $PATH | tr ":" "\n" | grep -v "venv/bin" | tr "\n" ":"`
# echo switched to: `pyenv which python`
export PATH=/Library/Frameworks/Python.framework/Versions/3.11/bin:$PATH
echo $PATH
export PROJECT=yandex2lightroom
cd ~/Projekte/${PROJECT} || exit 1
if [ -d dist ]; then
  rm -r dist
fi
if [ -d ${PROJECT}.egg-info ]; then
   rm -r ${PROJECT}.egg-info
fi
if [ -d build ]; then
  rm -r build
fi
#
# install from local
##python3 setup.py sdist
##pip3 install dist/${PROJECT}*.gz --force-reinstall
#
# upload to pypi
#
# wheel must be installed (.pyenv not venv) before:pip install wheel
python3 setup.py bdist_wheel
# twine must be installed (.pyenv not venv) before:pip install twine
# user:__token__
python3 -m twine upload --repository testpypi dist/*
##python3 -m twine upload --repository pypi dist/*

# cleanup
if [ -d dist ]; then
  rm -r dist
fi
if [ -d ${PROJECT}.egg-info ]; then
   rm -r ${PROJECT}.egg-info
fi
if [ -d build ]; then
  rm -r build
fi


