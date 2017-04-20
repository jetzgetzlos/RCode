complete <- function(directory, id = 1:332) {
    result <- data.frame(id = numeric(), nobs = numeric())
    #result <- data.frame()
    names(result) <- c("id", "nobs")
    
    for (i in id){
        
        if (i<10){
            file_number_string <- paste("00",as.character(i),sep = "")
        }
        else if (i<100){
            file_number_string <- paste("0",as.character(i),sep = "")        
        }
        else {
            file_number_string <- as.character(i)
        }
        
        
        file_name <- paste(directory,"/",file_number_string,".csv",sep = "", collapse = NULL)
        
        data_temp<- read.csv(file_name)
        good <- complete.cases(data_temp)
        complete_row <- nrow(data_temp[good,]) 
        result <- rbind(result, c(i,complete_row ))
    }
    names(result) <- c("id", "nobs")
    result
}