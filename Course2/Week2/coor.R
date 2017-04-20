corr <- function(directory, threshold = 0) {
    
    corr_vector <- c()
    
    complete_df <-complete(directory, 1:332)
    query <- complete_df["nobs"] > threshold
    good_id <- complete_df["id"][query]
    
    for (i in good_id){
        
        
        
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
        
        data_temp <- data_temp[good,]
        
        corr_vector <- c(corr_vector, cor(data_temp["sulfate"], data_temp["nitrate"]))
        
    }
    
    corr_vector
    
    
    
}