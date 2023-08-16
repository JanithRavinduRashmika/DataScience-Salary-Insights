



attach(cleanedDataSet)





dataSet = cleanedDataSet










radarData = table(work_year,remote_ratio)
radarData

a = radarData[1,]/sum(radarData[1,])
b = radarData[2,]/sum(radarData[2,])
c = radarData[3,]/sum(radarData[3,])
d = radarData[4,]/sum(radarData[4,])

data = cbind(a,b,c,d)
colnames(data) = c(2020,2021,2022,2023)
data = as.data.frame(data)
data = t(data)


data = rbind(1,0,data)
data = data.frame(data)

data

library(fmsb)

radarchart(data,pcol = colors_line,pfcol = colors_fill)


colors_fill = c(scales::alpha("red",0.3),
                scales::alpha("gold",0.3),
                scales::alpha("blue",0.3),
                scales::alpha("black",0.3))

colors_line = c(scales::alpha("darkgray",0.9),
                scales::alpha("gold",0.9),
                scales::alpha("tomato",0.9),
                scales::alpha("royalblue",0.0))


 