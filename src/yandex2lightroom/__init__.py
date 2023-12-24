from __future__ import absolute_import
import sys
import platform
import os


def run_main():
    from yandex2lightroom.image_download import main
    if sys.argv[1] == "Chrome":
        from yandex2lightroom.default_locations import DefaultLocations
        driver_directory = DefaultLocations().get_chromedriver_location()
        if platform.machine() != 'aarch64':
            from webdriver_auto_update.webdriver_auto_update import WebdriverAutoUpdate
            WebdriverAutoUpdate(driver_directory).main()
    args = None
    if len(sys.argv) == 1:
        args = ["Firefox", "-k", "New Topographics", "-l", "5"]
    main(args)


if __name__ == '__main__':
    run_main()
