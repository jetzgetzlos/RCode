Some **exploratory** plots 
```{r}
library(ggplot2, warn.conflicts = FALSE)
g <- ggplot(average_daily_activity, aes(date, steps)) +
    geom_bar(stat = "identity") +
    labs(y = "Total step by day") + 
    geom_hline(yintercept = mean(average_daily_activity$steps), linetype="dotted", color="red") +
    annotate(geom = "text", y = mean(average_daily_activity$steps), x = as.Date("2012-10-01"), label = "mean", color = "red") + 
    geom_hline(yintercept = median(average_daily_activity$steps), linetype="dotted", color="blue") +
    annotate(geom = "text", y = median(average_daily_activity$steps), x = as.Date("2012-10-01"), label = "median", color = "blue")
print(g)
```