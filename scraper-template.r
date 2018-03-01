

# PLEASE USE THE TEST DATA UNTIL YOU ARE READY TO MAKE THE FINAL RUN
condos <- read.csv("condo-test-data.csv") 

myresults <- data.frame()

for (i in 1:nrow(condos)){
  
  # YOUR SCRAPING CODE GOES HERE
  # DON'T FORGET TO ADD PAUSES USING Sys.sleep() SO THE PAGE HAS TIME TO LOAD
  
  thisresult <- data.frame(addr,unit,val,sqft)
  myresults <- rbind(myresults,thisresult)
  
}

