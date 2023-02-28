install.packages("ggExtra")

library("ggExtra")
library("ggplot2")

set.seed(30)
df1 <- data.frame(x = rnorm(500, 50, 10), y = runif(500, 0, 50))
p1 <- ggplot(df1, aes(x, y)) + geom_point() + theme_bw()
p1
ggMarginal(p1)

ggMarginal(p1, type = "histogram")

ggMarginal(p1, margins = "x", size = 2, type = "histogram",
           col = "blue", fill = "orange")

ggMarginal(p1, type = "histogram", xparams = list(binwidth = 1, fill = "orange"))

p <- ggMarginal(p1)
p


piris <- ggplot(iris, aes(Sepal.Length, Sepal.Width, colour = Species)) +
  geom_point()
ggMarginal(piris, groupColour = TRUE, groupFill = TRUE)
