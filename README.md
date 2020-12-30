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
* [Selenium Wire](https://github.com/wkeeling/selenium-wire) 2.1.2+
* Chrome is supported
* Firefox, Safari and Edge are supported but were not tested. 

# Installation
1. Get [Selenium driver executable](https://www.seleniumhq.org/about/platforms.jsp) for your browser and platform. Firefox, Chrome, Safari and Edge are supported.  
Use option `--driver-path` to specify the driver's path or add the executable in your PATH.


# Examples
Simple example using [Chrome WebDriver](https://sites.google.com/a/chromium.org/chromedriver/):

```$ yandex-images-download Chrome --keywords "vodka, bears, balalaika" --limit 10```

Example of using keywords from input file with specific image extension/format:

```$ yandex-images-download Chrome --keywords_from_file input_example.txt --itype=png```

All other information can be obtained with the `--help` argument.

# Acknowledgements
Special thanks to Alexander Kozlov (https://pypi.org/project/yandex-images-download/). He did most of the work through his project.