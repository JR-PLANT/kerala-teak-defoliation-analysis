# Teak defoliator project - Kerala

library(ggplot2)

# setting up the data
set.seed(123)

stand <- rep(c("Only_Teak", "Teak_Understory", "Mixed_Forest", "Bio_Spray"), each = 10)

eaten <- c(
  rnorm(10, mean = 75, sd = 6),
  rnorm(10, mean = 45, sd = 6),
  rnorm(10, mean = 28, sd = 5),
  rnorm(10, mean = 20, sd = 5)
)

# rounding the numbers so they look cleaner
eaten <- round(eaten, 1)

# calculating trunk growth based on leaves eaten
growth <- 1.3 - (0.01 * eaten) + rnorm(40, 0, 0.06)
growth <- round(growth, 2)

# putting everything into one dataframe
teak_data <- data.frame(
  Stand_Type = stand,
  Leaves_Eaten_Pct = eaten,
  Trunk_Growth_cm = growth
)

# check the data and save it
head(teak_data)
write.csv(teak_data, "teak_data.csv", row.names = FALSE)

# running anova test
model1 <- aov(Leaves_Eaten_Pct ~ Stand_Type, data = teak_data)
summary(model1)

# post-hoc test to see which specific forest types differ
TukeyHSD(model1)

# linear regression for growth
model2 <- lm(Trunk_Growth_cm ~ Leaves_Eaten_Pct, data = teak_data)
summary(model2)

# plot 1: boxplot
p1 <- ggplot(teak_data, aes(x = Stand_Type, y = Leaves_Eaten_Pct, fill = Stand_Type)) +
  geom_boxplot() +
  labs(title = "Leaf Damage by Forest Type",
       x = "Forest Type",
       y = "Leaves Eaten (%)") +
  theme_classic() +
  theme(legend.position = "none")

p1
ggsave("defoliation_boxplot.png", plot = p1, width = 6, height = 4, dpi = 300)

# plot 2: scatter plot with trendline
p2 <- ggplot(teak_data, aes(x = Leaves_Eaten_Pct, y = Trunk_Growth_cm)) +
  geom_point(aes(color = Stand_Type), size = 3) +
  geom_smooth(method = "lm", color = "black") +
  labs(title = "Leaves Eaten vs Trunk Growth",
       x = "Leaves Eaten (%)",
       y = "Trunk Growth (cm)") +
  theme_classic()

p2
ggsave("trunk_growth_loss.png", plot = p2, width = 6, height = 4, dpi = 300)