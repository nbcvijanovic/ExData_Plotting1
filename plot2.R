# read dataset
power_data<-read.table("C:/Data/Lectures and courses/data_science_spec/Exploratory data analysis/household_power_consumption.txt",sep = ";",na.strings = c("?"),dec = ".")
str(power_data)

# change date format
power_data$V1<-strptime(power_data$V1,"%d/%m/%Y")


# work with relevant subset of the dataset
power_data_short<-power_data[power_data$V1>="2007-02-01" & power_data$V1<"2007-02-03",]

# change time format
power_data_short$V2<-strptime(power_data_short$V2,"%H:%M:%S")
power_data_short$V3<-as.numeric(as.character(power_data_short$V3)) # convert to numeric

# save as png
png(filename = "plot2.png",width = 480, height = 480, units = "px")

# plot - you can find the days using weekdays(power_data_short$V1) and probably do this in a more automated fashion
plot(1:length(power_data_short$V1),power_data_short$V3,type = "l",ylab = "Global Active Power",xlab = "",xaxt = "n")
axis(1, at=c(0,24*60,48*60), labels=c("Thu","Fri","Sat"))

dev.off()# close the png graphics device