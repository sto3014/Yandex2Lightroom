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

```$ yandex2ligthroom Chrome --keywords "vodka, bears, balalaika" --limit 10```

Example of using keywords from input file with specific image extension/format:

```$ yandex2ligthroom Chrome --keywords_from_file input_example.txt --itype=png```

All other information can be obtained with the `--help` argument.
# Use case textures for Photoshop
Yandex2Lightroom sets keywords in the images after download. The keywords are the same as you defined for the search
itself.
To build a useful library for wall textures in Lightroom we need different searches with meanfuly keywords.



The image size should be at least large. It must be 
possible to update the collection, so existing images may not be overwritten. The more keywords we can get the better 
it is.

First make a search in yandex. As the search keywords will be later appear as keywords in LR we play around a bit:
* wall  
Of course to coarse
* brick wall  
Not too bad. If you scroll down a bit, Yandex suggests some other searches. For instance:
* wall brick cracked  
Looks good too  

In the end we decide to make three searches
* wall brick cracked
* old brick wall
* concrete wall
Thereby we get 5 keywords, which is not very much. In real, we would define our searches more precisely, like "red
  old brick wall".

The directory where the LR images should be placed is
* Windows  
  C:\Users\JohnDoe\Lightroom\Photos\Library\Textures\Walls
* macOS  
  /Users/JohnDoe/Lightroom/Photos/Library/Textures/Walls

To make these searches repeatable we should place them into a batch or shell script file.  
For Windows ``y2lr-texture-wall.bat``

    @echo off
    yandex2ligthroom Chrome --keywords "wall brick cracked" --limit 300 --isize large --skip-existing True --output-directory C:\Users\JohnDoe\Lightroom\Photos\Library\Textures\Walls
    yandex2ligthroom Chrome --keywords "old brick wall" --limit 300 --isize large --skip-existing True --output-directory C:\Users\JohnDoe\Lightroom\Photos\Library\Textures\Walls
    yandex2ligthroom Chrome --keywords "concrete wall" --limit 300 --isize large --skip-existing True --output-directory C:\Users\JohnDoe\Lightroom\Photos\Library\Textures\Walls

For macOS ``y2lr-texture-wall.sh``

    #!/usr/bin/env bash
    yandex2lightroom Chrome --keywords "wall brick cracked" --limit 300 --isize large --skip-existing True --output-directory /Users/JohnDoe/Lightroom/Photos/Library/Textures/Walls
    yandex2lightroom Chrome --keywords "old brick wall" --limit 300 --isize large --skip-existing True --output-directory /Users/JohnDoe/Lightroom/Photos/Library/Textures/Walls
    yandex2lightroom Chrome --keywords "concrete wall" --limit 300 --isize large --skip-existing True --output-directory /Users/JohnDoe/Lightroom/Photos/Library/Textures/Walls

After the images were downloaded, import them into LR:
* Just add, of course.
* Maybe not use your standard metadata preset.

Please check the keywords. Sometimes LR does not import them all. In Adobe Bridge they are fine, but not in LR. If so,
select all images and read in the metadata again.   
Also, some images may have no keywords because the exiftool run into a problem. There is a smart collection in LR to 
look for
images without keywords. So at least you have a chance to set keywords manually.


# Acknowledgements
Special thanks to Alexander Kozlov (https://pypi.org/project/yandex2ligthroom/). He did most of the work through 
his project.