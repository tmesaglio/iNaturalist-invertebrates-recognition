library(tidyverse)
library(ggrepel)



#australia
ii<-read.csv("id_through_time.csv")

bb <- c(2,3,4,5,6)
ll <- c("100","1,000","10,000","100,000","1,000,000")

ii %>%
  ggplot(aes(y=propIDspecies,x=propspecies,color=as.factor(year)))+
  geom_point(aes(size=logobs))+
  geom_line(aes(group = taxon),arrow = arrow(length = unit(0.1, "inches")))+
  theme_classic() + ylim(0,1)+
  scale_x_continuous(limits = c(0,1), expand = c(0, 0))+scale_y_continuous(limits = c(0,1), expand = c(0, 0)) +
  theme(axis.text = element_text(colour="black"))+
  scale_size_continuous(breaks = bb,
                                 limits = c(2, 6),
                                 labels = ll,
                                 range = c(2, 6) )

+
  geom_text_repel(aes(label=taxon))






ggsave("figure1updated.png", dpi=600, width=30, height=20, units ="cm")



#netherlands
jj<-read.csv("id_through_time_dutch.csv")

cc <- c(2,3,4,5,6)
mm <- c("100","1,000","10,000","100,000","1,000,000")




jj %>%
  ggplot(aes(y=propIDspecies,x=propspecies,color=as.factor(year)))+
  geom_point(aes(size=logobs), color="#00BFC4")+
  theme_classic() + ylim(0,1)+
  scale_x_continuous(limits = c(0,1.05), expand = c(0, 0))+scale_y_continuous(limits = c(0,1), expand = c(0, 0)) +
  theme(axis.text = element_text(colour="black"))+
  scale_size_continuous(breaks = cc,
                        limits = c(2, 6),
                        labels = mm,
                        range = c(2, 6) )
+
  geom_text_repel(aes(label=taxon))



ggsave("figure1dutch.png", dpi=600, width=30, height=20, units ="cm")




#taiwan
kk<-read.csv("id_through_time_taiwan.csv")

dd <- c(2,3,4,5,6)
nn <- c("100","1,000","10,000","100,000","1,000,000")




kk %>%
  ggplot(aes(y=propIDspecies,x=propspecies,color=as.factor(year)))+
  geom_point(aes(size=logobs), color="#00BFC4")+
  theme_classic() + ylim(0,1)+
  scale_x_continuous(limits = c(0,1), expand = c(0, 0))+scale_y_continuous(limits = c(0,1), expand = c(0, 0)) +
  theme(axis.text = element_text(colour="black"))+
  scale_size_continuous(breaks = dd,
                        limits = c(2, 6),
                        labels = nn,
                        range = c(2, 6) )
+
  geom_text_repel(aes(label=taxon))



ggsave("figure1taiwan.png", dpi=600, width=30, height=20, units ="cm")
