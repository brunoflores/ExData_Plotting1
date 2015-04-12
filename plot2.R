# Load and clean the raw data (this should take a while...)
source('load_and_clean.R')
load_and_clean()

# Open PNG file
png(filename = 'plot2.png', width = 480, height = 480)

# Plot data
with(data, plot.ts(Global_active_power, axes = F, xlab = '', ylab = 'Global Active Power (kilowatts)'))
axis(2)
axis(1, labels = c('Thu', 'Fri', 'Sat'), at = seq(1, length(data$Date), length.out = 3))
box()

# Save PNG file
dev.off()
