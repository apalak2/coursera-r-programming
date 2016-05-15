pollutantmean<-function(directory, pollutant, id=1:332){ 
  #setting the working directory to the one containing required .csv files
  specdatapath<-paste("C:/Users/aniru_000/Desktop/JHU R Course",directory,sep = "/")
  setwd(specdatapath)
  #Creating a combined data frame including all the files
  files<-list.files(pattern = "\\.csv")
  tables <- lapply(files, read.csv, header = TRUE)
  combineddata <- do.call(rbind , tables)
  #Creating a subset according to the function arguments i.e. the ID
  dataatstake<-subset(combineddata,combineddata$ID %in% id)
  #Calculating mean value of the required pollutant
  pollutantmeanvalue<- mean(dataatstake[,pollutant],na.rm = TRUE)
  #Printing the pollutant mean value
  print(pollutantmeanvalue)
}
