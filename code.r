# install packages
if(!require(gistr))install.packages("gistr")
if(!requireNamespace("animint2"))install.packages("animint2")
library(ggplot2)
require(animint2)
require(gistr)

# load data
airbnb.data <- read.csv(url("https://www.kaggle.com/rusiano/madrid-airbnb-data#listings_detailed.csv"))
head(airbnb.data)

# subset
airbnb.centro.data <- subset(airbnb.data, neighbourhood == 'Centro')
df <- data.frame(airbnb.centro.data)
df$price <- as.numeric(df$price)
df$bedrooms <- as.character(df$bedrooms)

# check the maximum of the price to set the y axis appropriately
max(df$price)

# plot data
scatter <- ggplot() + geom_jitter(mapping=aes(x=review_scores_value, y=price, color=bedrooms), data=df) + coord_cartesian(ylim = c(0, 500))

# print plot
scatter

# interactive plot
viz <- animint(scatter)

# publish
animint2gist(viz)
