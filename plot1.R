# read dataset
power_data<-read.table("C:/Data/Lectures and courses/data_science_spec/Exploratory data analysis/household_power_consumption.txt",sep = ";",na.strings = c("?"),dec = ".")
str(power_data)

# change to date and time format
power_data$V1<-strptime(power_data$V1,"%d/%m/%Y")
power_data$V2<-strptime(power_data$V2,"%H:%M:%S")

# work with relevant subset of the dataset
power_data_short<-power_data[power_data$V1>="2007-02-01" & power_data$V1<"2007-02-03",]

# save as png
png(filename = "plot1.png",width = 480, height = 480, units = "px")
# plot the required histogram
power_data_short$V3<-as.numeric(as.character(power_data_short$V3)) # convert to numeric
hist(power_data_short$V3,xlab = "Global Active Power (kilowatts)",ylab = "Frequency",col = "red",main = "Global Active power")


dev.off()# close the png graphics device