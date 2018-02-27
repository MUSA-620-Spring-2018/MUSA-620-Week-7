# MUSA-620-Week-7 - Web Scraping, Part 2

### Links
* [CSS selectors example](https://blueshift.io/selectors3.html)
* [rvest](https://cran.r-project.org/web/packages/rvest/rvest.pdf)

### Selenium

**Installation steps:**
1. Install Java JDK, following [these intructions for Windows](https://docs.oracle.com/javase/8/docs/technotes/guides/install/windows_jdk_install.html) or [these instructions for OS X](https://docs.oracle.com/javase/8/docs/technotes/guides/install/mac_jdk.html). You can download the latest Java JDK version [here](http://www.oracle.com/technetwork/java/javase/downloads/index.html).
2. Download the latest version of the [Selenium Standalone Server](http://www.seleniumhq.org/download/).
3. Download the latest version of [Chromedriver](https://sites.google.com/a/chromium.org/chromedriver/). And if you do not already have it, install [Chrome](https://www.google.com/chrome/).
4. Take a deep breath. You're halfway there.
5. Open a command prompt (in Windows press Win+R then type "cmd", in OS X search for "terminal" in Spotlight) and view your PATH environment variable. Windows: `echo %PATH%` / Mac OS: `echo $PATH`.
6. Unpack the Chromedriver executable file to one of the folders listed in your PATH.
7. **NEXT TIME, YOU CAN START AT THIS STEP** To start the server, open the command line and go to the directory where the Selenium Standalone Server file is downloaded and run "java -jar selenium-server-standalone-3.9.1.jar".

If you are not successful setting up the standalone server, not to worry. You can use [Sauce Labs](https://saucelabs.com/) instead. You can sign up for a [free Sauce Labs trial account here](https://saucelabs.com/signup/trial).
