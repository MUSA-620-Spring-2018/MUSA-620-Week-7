# MUSA-620-Week-7 - Web Scraping, Part 2

**Links**
* [CSS selectors example](https://blueshift.io/selectors3.html)
* [rvest](https://cran.r-project.org/web/packages/rvest/rvest.pdf)
* [RSelenium](https://cran.r-project.org/web/packages/RSelenium/RSelenium.pdf)

**Selenium setup:**
1. Install Java JDK, following [these intructions for Windows](https://docs.oracle.com/javase/8/docs/technotes/guides/install/windows_jdk_install.html) or [these instructions for OS X](https://docs.oracle.com/javase/8/docs/technotes/guides/install/mac_jdk.html). You can download the latest Java JDK version [here](http://www.oracle.com/technetwork/java/javase/downloads/index.html).
2. Download the latest version of the [Selenium Standalone Server](http://www.seleniumhq.org/download/).
3. Download the latest version of [Chromedriver](https://sites.google.com/a/chromium.org/chromedriver/). And if you do not already have it, install [Chrome](https://www.google.com/chrome/).
4. Take a deep breath. You're halfway there.
5. Open a command prompt (in Windows press Win+R then type "cmd", in OS X search for "terminal" in Spotlight) and view your PATH environment variable. Windows: `echo %PATH%` / Mac OS: `echo $PATH`.
6. Unpack the Chromedriver executable file to one of the folders listed in your PATH.
7. **NEXT TIME, YOU CAN START AT THIS STEP** To start the server, open the command line and go to the directory where the Selenium Standalone Server file is downloaded and run `java -jar selenium-server-standalone-3.9.1.jar`.

If you are not successful setting up the standalone server, not to worry. You can use [Sauce Labs](https://saucelabs.com/) instead. You can sign up for a [free Sauce Labs trial account here](https://saucelabs.com/signup/trial).

**Sauce Labs setup:**
1. After signing up and logging in, click your name in the upper right corner and go to User Settings.
2. Scroll down and copy the Access Key.
3. Paste it into the webdriver.r script along with your Sauce Labs username.
4. While running your scraper, you can watch the browser live from the Sauce Labs Dashboard page.




# Assignment <a id="assignment"></a>

Calculate the price per square foot of condominiums overlooking Rittenhouse Square by scraping the Philadelphia Property Database. Then present this information visually on a map.

This assignment is **required**. Please turn it in by email to myself (galkamaxd at gmail) and Evan (ecernea at sas dot upenn dot edu).

**Due:** Wednesday, 14-March by 9am

### Description

To calculate the average price per square foot for these homes, you will need to scrape the [Philadelphia Property Database](http://property.phila.gov/).

* This list of condos (address and unit #) are in the [condos-rittenhouse.csv](https://github.com/MUSA-620-Spring-2018/MUSA-620-Week-7/blob/master/condos-rittenhouse.csv) file. So as not to overload the Property Database server, please do not run the full dataset until you have confirmed your scraper is working and are ready for the final run. Instead, please use [condo-test-data.csv](https://github.com/MUSA-620-Spring-2018/MUSA-620-Week-7/blob/master/condo-test-data.csv) (contains only four records) for building and testing your scraper.
* See the [scraper-template.r](https://github.com/MUSA-620-Spring-2018/MUSA-620-Week-7/blob/master/scraper-template.r) script for some code to get you started.
* For the purposes of this assignment, please use the most recent Market Value as the price of the condo, as shown in the "VALUATION HISTORY" table. For the area of the condo, please use the field labeled "IMPROVEMENT AREA (SQFT)".
* Once you have collected the property values, you should calculate the average price per square foot for each of the buildings.
* Geocode the buildings with ggmap (**geocode only the building addresses, not each individual condo**). Note: the ggmap geocode has had some stability issues recently. If it fails for some of the addresses, the easiest solution is to record the geocoded addresses and rerun the ones that failed.
* Present the average price per square footage numbers visually on a map using ggplot2.

If you are having problems getting the Selenium Standalone Server working, you can find more [information here](https://cran.r-project.org/web/packages/RSelenium/vignettes/RSelenium-basics.html). We can also go through it in office hours. However, this project is not meant to be an exercise in setting up servers, so if you are finding it overwhelming to set up the standalone server, you should just use [Sauce Labs](https://saucelabs.com/), as we did in class. You can sign up for a [free Sauce Labs trial account here](https://saucelabs.com/signup/trial).

### Deliverable

- A map showing each building's average price per square foot
- The output data from your scraper (the value and sqare footage of each condo)
- all R scripts used in scraping, analyzing, and visualizing the data
- a written explanation of: the steps you took to create it, any challenges you encountered along the way, and reasons for your design choices.

### Additional Comments

* Out of courtesy for the maintainers of the Philly Property Database and its other users, please do your best to avoid overloading their server. When you are ready for your scraper's final run, you should do so outside of normal working hours. And please remember to include at least a few seconds of pause between page loads, using the Sys.sleep() command.

* Scraping is messy, and this assignment is no exception. If/when you run into problems, please do your best to improvise.

* If your scraper fails midway through, you should store the results that you already have and pick up where you left off, rather than starting from scratch.

* If you run into problems with specific addresses, please use your best judgment to come up with a solution and explain it in your writeup.

* If you encounter a problems with the website not working (e.g. it's not returning results for addresses that you know are valid), please report the issue to me. 
