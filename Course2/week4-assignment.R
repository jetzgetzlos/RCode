best <- function (state, outcome){
    
    t_outcome <- read.csv("outcome-of-care-measures.csv", colClasses =  "character")
    
    
    query_STATE <- (t_outcome[,7]==state)
    
    query <- data.frame(t_outcome[,7][query_STATE])
    if (nrow(query) == 0){
        stop("invalid state")
    }
    
    outcome_col <-0

   if (outcome == "heart attack"){
       outcome_col <- 11
       
   } else if (outcome == "heart failure"){
       outcome_col <- 17
       
   } else if (outcome == "pneumonia"){
       outcome_col <- 23
   } else {
       stop("invalid outcome")
   }
    
    #On commence
    names(t_outcome) <- c(1:25)
    head(t_outcome)
    
    #View(t_outcome)
    sp <- t_outcome[,c(as.character(2),as.character(7),as.character(outcome_col))]
    
    names(sp) <- c("name","state","outcome")
    
    sp<- sp[query_STATE,c("name","outcome")]
    
    good <- (sp[,"outcome"] != "Not available")
    sp <- sp[good,]
    
    sp[,"outcome"] <- as.numeric(sp[,"outcome"])
    
    sp <- sp[order(sp[,c("outcome")],sp[,c("name")]),]
    View(sp)
    as.character(sp[1,"name"]) 
    

}