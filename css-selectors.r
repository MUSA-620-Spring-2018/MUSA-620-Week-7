
#SELECTOR EXAMPLES USING RVEST

library(rvest)
# https://cran.r-project.org/web/packages/rvest/rvest.pdf


website <- read_html("https://blueshift.io/selectors3.html")


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

#Compound Selector
#  Find the element with an id of "fruits"
#  Then from its children, select the first "li" element
compoundExample <- html_nodes(website,"#fruits > li:nth-child(1)") %>% html_text()
compoundExample$getElementText()




# *** QUESTIONS ****

# What is this selector doing?
compoundExample2 <- html_nodes(website,"body div #programming-languages .item2") %>% html_text()
compoundExample2

# What do each of these selectors do?
html_nodes(website,"body > div") %>% html_text()
html_nodes(website,"body div") %>% html_text()
html_nodes(website,"li div") %>% html_text()

# All but one of these selectors will return the same selection
# Which one is different?
html_nodes(website,"body div ul li") %>% html_text()
html_nodes(website,"body > div > ul > li") %>% html_text()
html_nodes(website,"body > div ul > .item") %>% html_text()
html_nodes(website,"body > div:nth-child(2) ul > .item") %>% html_text()
html_nodes(website,"div > ul > li") %>% html_text()
html_nodes(website,"ul > li") %>% html_text()
html_nodes(website,"body > div li") %>% html_text()
html_nodes(website,"#programming-languages li") %>% html_text()
html_nodes(website,"#programming-languages .item") %>% html_text()
html_nodes(website,".unordered-list li") %>% html_text()

# Can you come up with another selector that does the same thing?



# *** HTML TABLES ***

# Scrape a HTML table into a data frame
#https://en.wikipedia.org/wiki/List_of_U.S._states_and_territories_by_population

wikipediaPage <- read_html("https://en.wikipedia.org/wiki/List_of_U.S._states_and_territories_by_population")

# find the CSS selector of the table using the Web Inspector Network tab
wikiTableElement <- html_nodes(wikipediaPage,"#mw-content-text > div > table:nth-child(12)")

wikiTable <- html_table(wikiTableElement, fill=T,trim=T,header=T) %>%
  data.frame()

# Scraped data will often be messy
View(wikiTable)


