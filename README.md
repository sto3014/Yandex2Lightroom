# Yandex to Lightroom
Python Script to download images from Yandex.Images for using in Adobe Lightroom.

# Features
* Checking for captcha presence
* Many filters
* Multiproccessing is available (option `--num-workers`)
* Existing images can be skipped.  
* Set search keywords as Lightroom keywords.
* Set image url as creator web address (IPC)

# Main requirements
* Python 3.9+ 
* Selenium Wire 2.1.2+  
* Exiftool 12.13+
* Chrome, Firefox, Safari and Edge are supported. 

# Installation
1. [Python](https://www.python.org/downloads/)
2. PIP 
   * Windows
        * python -m pip install --upgrade pip
   * macOS
        * curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py  
        * python get-pip.py
3. [Selenium Wire](https://pypi.org/project/selenium-wire/) 
    * pip install selenium-wire
4. [Selenium driver executable](https://www.selenium.dev/downloads/)  
   Get the right driver for your browser (see browser section on the link above)
   and platform. Firefox, Chrome, Safari and Edge are supported.   
   Use option `--driver-path` to specify the driver's path or add the executable in your PATH.  
   Additional helpful pages:
    * [ChromeDriver - WebDriver for Chrome](https://chromedriver.chromium.org/downloads)
    * [How To Run Test On macOS Using Selenium Safari Driver](https://www.lambdatest.com/blog/selenium-safaridriver-macos/)
5. [Exiftool](https://exiftool.org)
   The exiftool executable must added in your PATH. For macOS, it is done automatically by putting it into
   /usr/local/bin. For Windows, you must extend your PATH variable. 

# Examples
Simple example using [Chrome WebDriver](https://sites.google.com/a/chromium.org/chromedriver/):

```$ yandex-images-download Chrome --keywords "vodka, bears, balalaika" --limit 10```

Example of using keywords from input file with specific image extension/format:

```$ yandex-images-download Chrome --keywords_from_file input_example.txt --itype=png```

All other information can be obtained with the `--help` argument.

# Acknowledgements
Special thanks to Alexander Kozlov (https://pypi.org/project/yandex-images-download/). He did most of the work through his project.