# Load and clean the raw data (this should take a while...)
source('load_and_clean.R')
load_and_clean()

# Open PNG file
png(filename = 'plot1.png', width = 480, height = 480)

# Plot data
with(data, hist(Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)'))

# Save PNG file
dev.off()
