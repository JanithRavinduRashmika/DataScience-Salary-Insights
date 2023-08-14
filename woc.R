dataSet


summary(as.factor(dataSet$job_category))
summary(as.factor(dataSet$company_size))

jo = table(dataSet$job_category)
jo

library(ggplot2)
library(dplyr)
library(scales)

scaplyr::count(dataSet$job_category)

ggplot(jo,aes(jo$,))




# R Base aggregate() on multiple columns
barD <- aggregate(dataSet$job_category, by=list(dataSet$company_size,dataSet
                                                  $job_category), FUN=length)
barD


ggplot(barD,aes(barD$Group.2,barD$x,fill = barD$Group.1))+
  geom_bar(position = "fill",stat = "identity",legend=F)+
  scale_y_continuous(labels = percent)+
  labs(title = "Company Sizes Across Job Category",x = "Job Category",y = "Percentage")+
  theme(axis.title = element_text(face = "bold"),plot.title = element_text(face = "bold",size = 16),axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1),
        legend.title = element_blank())
  
