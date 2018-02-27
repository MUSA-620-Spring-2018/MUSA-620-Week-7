

devtools::install_github("ropensci/RSelenium")
require(RSelenium)
require(rvest)


# *** RUN THIS SECTION ONLY IF YOU ARE USING SAUCE LABS ***
user <- "maxgalka" # Your Sauce Labs Username
pass <- "2627ac18-xxxx-43e3-9d7b-2a9882889569" # Your Sauce Labs access key

port <- 80
ip <- paste0(user, ':', pass, "@ondemand.saucelabs.com")
rdBrowser <- "chrome"
version <- "33"
platform <- "Windows 10"
extraCapabilities <- list(name = "RSelenium", username = user
                          , accessKey = pass, tags = list("RSelenium-vignette", "OS/Browsers-vignette"))
remDr <- remoteDriver$new(remoteServerAddr = ip, port = port, browserName = rdBrowser
                          , version = version, platform = platform
                          , extraCapabilities = extraCapabilities)
# **********************************************************

# *** RUN THIS COMMAND ONLY IF YOU ARE USING A LOCAL SELENIUM SERVER ***
# Before starting, make sure Selenium is running: java -jar selenium-server-standalone-3.9.1.jar
remDr <- remoteDriver(browserName = "chrome")
# **********************************************************************


remDr$open()
remDr$navigate("https://blueshift.io/selectors3.html")


#Grab the full DOM so we can hand it off to rvest
website = read_html(remDr$findElement("css selector", "html")$getElementAttribute("innerHTML")[[1]])


#CSS Selector: tag
#  Select all li elements
allListItems <- html_nodes(website,"li") %>% html_text()
allListItems

#CSS Selector: class
#  Select all elements with a class of "item2"
secondItems <- html_nodes(website,".item2") %>% html_text()
secondItems

#CSS Selector: id
#  Select the element with an id of "fruits"
fruitList <-  html_nodes(website,"#fruits") %>% html_text()
fruitList

#Click the "Show More" button
showmore <- remDr$findElement("css selector", "body > button")
showmore$clickElement()

# Grab the DOM and try the same selections from above
website = read_html(remDr$findElement("css selector", "html")$getElementAttribute("innerHTML")[[1]])
html_nodes(website,"li") %>% html_text()
html_nodes(website,".item2") %>% html_text()

# More useful Selenium commands
remDr$goBack()
remDr$goForward()
remDr$setWindowSize(500, 500)
remDr$refresh()

remDr$navigate("https://twitter.com/search-home")
remDr$screenshot(display = T, useViewer = T, file = "myscreenshot.png")
searchBar <- remDr$findElement("css selector","#search-home-input")
searchBar$sendKeysToElement(list('#selenium'))
searchBar$sendKeysToElement(list(key = 'enter'))

website = read_html(remDr$findElement("css selector", "body")$getElementAttribute("innerHTML")[[1]])

html_nodes(website,".stream-item:nth-child(2) .js-tweet-text-container") %>% html_text()
html_nodes(website,".stream-item:nth-child(3) .js-tweet-text-container") %>% html_text()
html_nodes(website,".stream-item:nth-child(4) .js-tweet-text-container") %>% html_text()
