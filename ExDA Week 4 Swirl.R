library(swirl)
swirl()

dim(pm0)
head(pm0)

cnames
cnames <- strsplit(cnames, "|", fixed = TRUE)
cnames

names(pm0) <- make.names(cnames[[1]][wcol])
head(pm0)
x0 <- pm0$Sample.Value
str(x0)
mean(is.na(x0))

names(pm1) <- make.names(cnames[[1]][wcol])
dim(pm1)
x1 <- pm1$Sample.Value
mean(is.na(x1))

summary(x0)
summary(x1)

boxplot(x0, x1)
boxplot(log10(x0), log10(x1))
negative <- x1 < 0
sum(negative, na.rm = TRUE)
mean(negative, na.rm = TRUE)
head(negative)

dates <- pm1$Date
str(dates)
dates <- as.Date(as.character(dates), "%Y%m%d")
head(dates)

str(negative)
hist(dates[negative], "month")

str(site0)
str(site1)
both <- intersect(site0, site1)
both

head(pm0)
cnt0 <- subset(pm0, pm0$State.Code == 36 & pm0$county.site %in% both)

cnt0 <- subset(pm0, State.Code == 36 & county.site %in% both)
cnt1 <- subset(pm1, State.Code == 36 & county.site %in% both)

sapply(split(cnt0, cnt0$county.site), nrow)
sapply(split(cnt1, cnt1$county.site), nrow)


























