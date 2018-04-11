# this is working graphics for the 2018 OREI grant 
getwd()
setwd("C:/Users/jbarlow/Documents/Computational Biology/Bio381_2018")

case <- read.table("beddingcases.csv",row.names = 1, header=TRUE, sep=",",stringsAsFactors = FALSE)

scc <- read.table("beddingscc.csv",row.names = 1, header=TRUE, sep=",",stringsAsFactors = FALSE)

case
scc
library(ggplot2)
library(ggthemes)
# Basic scatter of points - cases per 10,000 cow days

p <- ggplot(case, aes(x=house, y=cases12_100cy))
p

p + stat_summary(fun.y=mean, geom="point", shape=23, size=4) + geom_dotplot(binaxis='y', stackdir='center', dotsize=1)

p+ geom_boxplot (notch=FALSE, varwidth=TRUE, outlier.size=.75, outlier.color="blue") + geom_dotplot(binaxis='y', stackdir='center', dotsize=.75, color="blue") + stat_summary(fun.y=mean, geom="point", shape=5, size=5, color="red") + geom_rangeframe(inherit.aes = TRUE) + scale_x_discrete(limits=c("Bedded-pack", "Free-stall", "Tie-stall")) + theme_tufte() + labs(title = "Variation in Clinical Mastitis cases among organic dairy herds in Vermont by housing type", x = "Housing Type", y = "Clinical mastitis cases per 100 cow years")

# scatter scc_cat
p <- ggplot(case, aes(x=house, y=scc_cat))
p
##+geom_bar()
p + stat_summary(fun.y=mean, geom="point", shape=23, size=4) + geom_dotplot(binaxis='y', stackdir='center', dotsize=1)

p+ stat_summary(fun.y=mean, geom="point", shape=23, size=4, color="red") + geom_dotplot(binaxis='y', stackdir='center', dotsize=1) + geom_rangeframe(inherit.aes = TRUE) + scale_x_discrete(limits=c("Bedded-pack", "Free-stall", "Tie-stall")) + theme_tufte() + labs(title = "Variation in SCC category among organic dairy herds in Vermont by housing type", x = "Housing Type", y = "SCC Category")

# scatter bact_cat
p <- ggplot(case, aes(x=house, y=bact_cat))
p
##+geom_bar()
p + stat_summary(fun.y=mean, geom="point", shape=23, size=4) + geom_dotplot(binaxis='y', stackdir='center', dotsize=1)

p+ stat_summary(fun.y=mean, geom="point", shape=23, size=4, color="red") + geom_dotplot(binaxis='y', stackdir='center', dotsize=1) + geom_rangeframe(inherit.aes = TRUE) + scale_x_discrete(limits=c("Bedded-pack", "Free-stall", "Tie-stall")) + theme_tufte() + labs(title = "Variation in bulk tnak milk bacteriology category among organic dairy herds in Vermont by housing type", x = "Housing Type", y = "BTM bact cat")

p <- ggplot2(scc, aes(x=house, y=scc))
p

p + stat_summary(fun.y=mean, geom="point", shape=23, size=4) + geom_dotplot(binaxis='y', stackdir='center', dotsize=1)

p + geom_boxplot (notch=FALSE, varwidth=TRUE, outlier.size=.75, outlier.color="blue") + geom_dotplot(binaxis='y', stackdir='center', dotsize=.75, color="blue") + stat_summary(fun.y=mean, geom="point", shape=5, size=5, color="red") + geom_rangeframe(inherit.aes = TRUE) + scale_x_discrete(limits=c("Bedded-pack", "Free-stall", "Tie-stall")) + theme_tufte() + labs(title = "Variation in SCC among organic dairy herds in Vermont by housing type", x = "Housing Type", y = "SCC")

#+ scale_y_continuous(limits=(0,900000))
