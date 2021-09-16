#load data

figure1 <-
  read.csv(
    "figure1.csv",
    header = T,
    strip.white = T,
    na.strings = ""
  )

#create base plot

plot(propspecies ~ propIDspecies,
     data = figure1,
     ylim = c(0, 1))
with(figure1[1:37, ],
     text(
       propspecies ~ propIDspecies,
       labels = taxon,
       pos = 4
     ))

#load packages

library(ggplot2)
library(ggrepel)

#this code is for the figure with taxon labels (to keep track of where each thing is
#when editing in photoshop)

p1 <- ggplot(figure1, aes(x=propIDspecies, y=propspecies, size=logobs)) + geom_point() +
  ggrepel::geom_label_repel(aes(label = taxon), force=1,min.segment.length = 1, size=1.5, label.size = NA) +
  theme_classic() + ylim(0,1)+
  scale_x_continuous(limits = c(0,1), expand = c(0, 0))+scale_y_continuous(limits = c(0,1), expand = c(0, 0)) +
  theme(axis.text = element_text(colour="black"))

#this code is for the figure without the labels

p1 <- ggplot(figure1, aes(x=propIDspecies, y=propspecies, size=logobs)) + geom_point() +
  theme_classic() + ylim(0,1)+
  scale_x_continuous(limits = c(0,1), expand = c(0, 0))+scale_y_continuous(limits = c(0,1), expand = c(0, 0)) +
  theme(axis.text = element_text(colour="black"))

#plot the figure

p1

#change the legend if desired

bb <- c(2,3,4,5,6)
ll <- c("100","1,000","10,000","100,000","1,000,000")
p2 <- p1 + scale_size_continuous(name = "Total observations",
                           breaks = bb,
                           limits = c(2, 6),
                           labels = ll,
                           range = c(2, 6) )
p2

#export image

ggsave("figure1.png", dpi=600, width=30, height=20, units ="cm")

#note that the figure was edited aesthetically in external software


