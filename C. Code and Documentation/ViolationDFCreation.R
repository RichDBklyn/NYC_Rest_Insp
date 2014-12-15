RawData <- read.csv("RawData.csv")
#Assumes RawData file is in working directory

ViolationDF<-RawData[,c("CAMIS","BORO","ZIPCODE","CUISINE.DESCRIPTION",
      "INSPECTION.DATE","INSPECTION.YEAR","VIOLATION.CODE","CRITICAL.FLAG")]
ViolationDF$INSPECTION.DATE<-as.Date(ViolationDF$INSPECTION.DATE,"%m/%d/%y")
#Extracts an cleans relevant violation-level data

ViolationSchema<-unique(RawData[,c("VIOLATION.CODE","VIOLATION.DESCRIPTION")])
ViolationSchema<-ViolationSchema[order(ViolationSchema$VIOLATION.CODE),]
TYPE<-c("No Violation",rep("Food Operations",11), "Facility",
        "Food Operations","Facility",
        rep("Food Operations",8),rep("Pest",5),
        rep("Facility",6),rep("Food Operations",4),
        rep("Facility",3),"Other",rep("Facility",3),
        rep("Food Operations",5),rep("Facility",10),
        "Food Operations",rep("Facility",5),
        rep("Food Operations",2), rep("Facility",5),
        "Other", rep("Facility",4),rep("Food Operations",3),
        rep("Facility",2),rep("Food Operations",2),"Other")
ViolationSchema<-cbind(ViolationSchema,TYPE)
rm(RawData)
rm(TYPE)
#Assigns a type to each unique violation for which a restaurant has been cited

VLookup<-unique(ViolationSchema[,c("VIOLATION.CODE","TYPE")])
ViolationDF<-merge(ViolationDF,VLookup,by='VIOLATION.CODE')
#Creates vertical lookup table to merge violation type into data frame

ViolationDF<-ViolationDF[c(2,6:7,1,8:9,3:5)]
ViolationDF<-ViolationDF[order(ViolationDF$CAMIS,ViolationDF$INSPECTION.DATE,
      ViolationDF$VIOLATION.CODE),]
#Reorders columns and sorts rows by (1) restaurant (2) inspections conducted
      #at that restaurant and (3) violations cited in each inspection. 

ViolationDF$NewRest<-c(1,!diff(ViolationDF$CAMIS)==0)
#Creates dummy variable in each row where data on new restaurant starts
n<-length(ViolationDF$CAMIS)
ViolationDF$INSPECTION.NUM<-rep(NA,n)
x<-1
while(x<=n){
      if(ViolationDF$NewRest[x]==1){
            ViolationDF$INSPECTION.NUM[x]<-1} else
      if(ViolationDF$INSPECTION.DATE[x]==ViolationDF$INSPECTION.DATE[x-1])
            {ViolationDF$INSPECTION.NUM[x]<-ViolationDF$INSPECTION.NUM[x-1]}
      else {ViolationDF$INSPECTION.NUM[x]<-ViolationDF$INSPECTION.NUM[x-1]+1}
x<-x+1
}
#Numbers each inspection a restaurant receives

ViolationDF$INSPECTION.ID<-
      paste(as.character(ViolationDF$CAMIS),"-",
            as.character(ViolationDF$INSPECTION.NUM))
#Creates unique identifier for each inspection
#Format XXXXXXXXXX - YY
#XXXXXXXXXX = 10-digit CAMIS number identifying restaurant
#YY - 1- or 2- digit number identifying which inspection

ViolationDF<-ViolationDF[,-10]
#Removes dummy variable