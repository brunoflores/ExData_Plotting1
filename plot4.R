# Load and clean the raw data (this should take a while...)
source('load_and_clean.R')
load_and_clean()

# Open PNG file
png(filename = 'plot4.png', width = 480, height = 480)

# Split in two rows/tow columns
par(mfrow = c(2,2))

# Plot data
with(data, plot.ts(Global_active_power, axes = F, xlab = '', ylab = 'Global Active Power'))
axis(2)
axis(1, labels = c('Thu', 'Fri', 'Sat'), at = seq(1, length(data$Date), length.out = 3))
box()

# Plot data
with(data, plot.ts(Voltage, axes = F, xlab = 'datetime', ylab = 'Voltage'))
axis(2)
axis(1, labels = c('Thu', 'Fri', 'Sat'), at = seq(1, length(data$Date), length.out = 3))
box()

# Plot data
with(data, plot.ts(Sub_metering_1, axes = F, xlab = '', ylab = 'Energy sub metering', col = 'black'))
axis(2)
axis(1, labels = c('Thu', 'Fri', 'Sat'), at = seq(1, length(data$Date), length.out = 3))
box()
lines(data$Sub_metering_2, col = 'red')
lines(data$Sub_metering_3, col = 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lwd = 2, bty = 'n')

# Plot data
with(data, plot.ts(Global_reactive_power, axes = F, xlab = 'datetime'))
axis(2)
axis(1, labels = c('Thu', 'Fri', 'Sat'), at = seq(1, length(data$Date), length.out = 3))
box()

# Save PNG file
dev.off()
