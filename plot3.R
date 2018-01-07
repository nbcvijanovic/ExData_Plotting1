power_data<-read.table("C:/Data/Lectures and courses/data_science_spec/Exploratory data analysis/household_power_consumption.txt",sep = ";",na.strings = c("?"),dec = ".")
str(power_data)

# change date format
power_data$V1<-strptime(power_data$V1,"%d/%m/%Y")


# work with relevant subset of the dataset
power_data_short<-power_data[power_data$V1>="2007-02-01" & power_data$V1<"2007-02-03",]

# change time format
power_data_short$V2<-strptime(power_data_short$V2,"%H:%M:%S")
power_data_short$V7<-as.numeric(as.character(power_data_short$V7)) # convert to numeric
power_data_short$V8<-as.numeric(as.character(power_data_short$V8)) # convert to numeric
power_data_short$V9<-as.numeric(as.character(power_data_short$V9)) # convert to numeric

# plot and save in png
png(filename = "plot3.png",width = 480, height = 480, units = "px")

plot(1:length(power_data_short$V1),power_data_short$V7,type = "l",ylab = "Energy sub metering",xlab = "",xaxt = "n")
axis(1, at=c(0,24*60,48*60), labels=c("Thu","Fri","Sat"))
lines(1:length(power_data_short$V1),power_data_short$V8,col="red")
lines(1:length(power_data_short$V1),power_data_short$V9,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col = c("black","red","blue"))

dev.off()