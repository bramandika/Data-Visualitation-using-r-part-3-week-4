library(tidyverse)
data(mpg)
force(mpg)


x_jitter <- jitter(mpg$cyl)   # Jitter with large factor
plot(mpg$cyl,mpg$hwy )   # Correlation plot after using large factor
plot(x_jitter,mpg$hwy )
par(bg = "#353436")                       # Set background color
dev.off()




#basic jitter plot
ggplot(mpg, aes(x = cyl, y = hwy)) +
  geom_jitter()

#adding color based on class
ggplot(mpg, aes(x = cyl, y = hwy, colour = class)) +
  geom_jitter()

#deviding plot using facet grid based on class
ggplot(mpg, aes(x = cyl, y = hwy, colour = class)) +
  geom_jitter() +
  facet_grid(~class)
#adding mean and legend to the plot
ggplot(mpg, aes(x = cyl, y = hwy, colour = class)) +
  geom_jitter() +
  stat_summary(
    fun = mean,
    geom = "point",
    size = 3,
    color = "red")+
  scale_fill_brewer()+
  theme(legend.position="bottom")



