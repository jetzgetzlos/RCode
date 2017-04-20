pollutantmean <- function(directory, polluant, id = 1:332){
    #print(directory)
    
    data <- data.frame()
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
        #print(file_name)
        data_temp<- read.csv(file_name)
        #print(data_temp)
        data <- rbind(data, data_temp)
    }
    
    mean(data[[polluant]], na.rm = TRUE)

}