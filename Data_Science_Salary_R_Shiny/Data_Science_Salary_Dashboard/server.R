library(shiny)
library(wordcloud2)
library(RColorBrewer)
library(plyr)
library(countrycode)
library(maps)
library(tidyverse)
library(DT)




function(input, output, session) {
  
  data = read.csv("../Data_Science_Salary_Dashboard/data/dataFiltered.csv")
  
  output$wordCloud = renderWordcloud2({
    
    if(input$wcyear == "All"){
      cJobT = plyr::count(data$Designation)
    }else{
      cJobT = plyr::count(data[data$Working_Year==input$wcyear,]$Designation)
    }
    
    
    cJobT = cJobT[order(cJobT$freq,decreasing = T),]
    cJobT["sqrtFreq"] = sqrt(cJobT$freq)
    
    set.seed(12345)
    wordcloud2(cJobT[c(1,3)],size = 0.5)
  })
  
  
  output$empDis = renderPlot({
    
    
    if(input$empyear != "All"){
      if(input$empJcat != "All"){
        mdata = subset(data, data$Working_Year == input$empyear & data$DesignationCategory == input$empJcat)
      }else{
        mdata = subset(data, data$Working_Year == input$empyear)
      }
    }else{
      if(input$empJcat != "All"){
        mdata = subset(data, data$DesignationCategory == input$empJcat)
      }else{
        mdata = data
      }
    }
    
    countryName = countrycode::countrycode(mdata$Employee_Location, "iso2c", "country.name")
    
    countryFreq = plyr::count(countryName)
    
    mapData = maps::map("world", ".", exact = FALSE, plot = FALSE, fill = TRUE) %>% fortify()
    
    
    
    countryFreq$x[!(countryFreq$x %in% mapData$region)]
    
    countryFreq$x[countryFreq$x == "Bosnia & Herzegovina"] = "Bosnia and Herzegovina"
    countryFreq$x[countryFreq$x == "Czechia"] = "Czech Republic"
    countryFreq$x[countryFreq$x == "Hong Kong SAR China"] = "China"
    countryFreq$x[countryFreq$x == "United Kingdom"] = "UK"
    countryFreq$x[countryFreq$x == "United States"] = "USA"
    
    
    
    countryFreq$x[!(countryFreq$x %in% mapData$region)]
    colnames(countryFreq)[1] = "region"
    
    countryFreq["logFreq"] = log10(countryFreq$freq)
    
    
    mapData = dplyr::left_join(mapData,countryFreq,by = "region")
    
    
    ggplot(mapData,aes(mapData$long,mapData$lat,group=mapData$group))+
      geom_polygon(aes(fill = mapData$logFreq),color = "#373737")+
      scale_fill_gradient(low = "#d75ca2",high = "#410179",na.value = "#c0c0c2",breaks =c(0,1,2,3),labels = c("0","10","100","1000"),name = "")+
      labs(title = "",x="",y="")+
      scale_x_continuous(labels = NULL)+
      scale_y_continuous(labels = NULL)+
      theme(plot.title = element_text(size = 16,face = "bold"))
    
    
    
    
  })
  
  output$cmpDis = renderPlot({
    
    if(input$cmpyear != "All"){
      if(input$cmpJcat != "All"){
        mdata = subset(data, data$Working_Year == input$cmpyear & data$DesignationCategory == input$cmpJcat)
      }else{
        mdata = subset(data, data$Working_Year == input$cmpyear)
      }
    }else{
      if(input$cmpJcat != "All"){
        mdata = subset(data, data$DesignationCategory == input$cmpJcat)
      }else{
        mdata = data
      }
    }
    
    companyLoc = countrycode::countrycode(mdata$Company_Location, "iso2c", "country.name")
    
    companyFreq = plyr::count(companyLoc)
    
    mapData = maps::map("world", ".", exact = FALSE, plot = FALSE, fill = TRUE) %>% fortify()
    
    companyFreq$x[companyFreq$x == "Bosnia & Herzegovina"] = "Bosnia and Herzegovina"
    companyFreq$x[companyFreq$x == "Czechia"] = "Czech Republic"
    companyFreq$x[companyFreq$x == "Hong Kong SAR China"] = "China"
    companyFreq$x[companyFreq$x == "United Kingdom"] = "UK"
    companyFreq$x[companyFreq$x == "United States"] = "USA"
    
    
    
    
    colnames(companyFreq)[1] = "region"
    
    companyFreq["logFreq"] = log10(companyFreq$freq)
    
    mapData = dplyr::left_join(mapData,companyFreq,by = "region")
    
    
    ggplot(mapData,aes(long,lat,group=group))+
      geom_polygon(aes(fill = logFreq),color = "#373737")+
      scale_fill_gradient(low = "#67e26d",high = "#065064",na.value = "#c0c0c2",breaks =c(0,1,2,3),labels = c("0","10","100","1000"),name = "")+
      labs(title = "",x="",y="")+
      scale_x_continuous(labels = NULL)+
      scale_y_continuous(labels = NULL)
    
    
  })
  
  
  output$numEmp = renderValueBox({
    valueBox(nrow(data),"Employees", icon = icon("users"))
  })
  
  output$numJobTitle = renderValueBox({
    valueBox(length(unique(data$Designation)),"Job Titles", icon = icon("briefcase"), color = "green")
  })
  
  output$avgSalary = renderValueBox({
    valueBox(round(mean(data$USDSalary),2),"Avarage Salary", icon = icon("usd"), color = "orange")
  })
  
  output$numCompanyBasedCountries = renderValueBox({
    valueBox(length(unique(data$Company_Location)),"Countries of Operation", icon = icon("globe"), color = "green")
  })
  
  output$numEmpCountries = renderValueBox({
    valueBox(length(unique(data$Employee_Location)),"Employee Nationality", icon = icon("id-card"))
  })
  
  output$avgSalPlot = renderPlot({
    
    if(input$avgSal == "All"){
      avgSalary = aggregate(USDSalary ~ Working_Year + DesignationCategory, data, mean)
      avgSalary$Working_Year <- as.numeric(as.character(avgSalary$Working_Year))
      
      ggplot(avgSalary, aes(Working_Year, USDSalary, color = DesignationCategory)) +
        geom_point(size = 3, alpha = 0.5) +
        geom_line(size = 1) +
        labs(title = "",
             x = "",
             y = "") +
        theme(axis.title = element_text(face = "bold"),
              plot.title = element_text(face = "bold", size = 16),
              legend.title = element_blank())+
        scale_x_continuous(breaks = c(2020, 2021, 2022), labels = c("2020", "2021", "2022"))
    }else{
      pdata = subset(data, data$DesignationCategory == input$avgSal)
      avgSalary = aggregate(USDSalary ~ Working_Year + Designation, pdata, mean)
      avgSalary$Working_Year <- as.numeric(as.character(avgSalary$Working_Year))
      
      ggplot(avgSalary, aes(Working_Year, USDSalary, color = Designation)) +
        geom_point(size = 3, alpha = 0.5) +
        geom_line(size = 1) +
        labs(title = "",
             x = "",
             y = "") +
        theme(axis.title = element_text(face = "bold"),
              plot.title = element_text(face = "bold", size = 16),
              legend.title = element_blank())+
        scale_x_continuous(breaks = c(2020, 2021, 2022), labels = c("2020", "2021", "2022"))
    }
    
    
  })
  
  
  output$dataTable = renderDataTable({
    jye = data
    jex = data
    jst = data
    jcs = data
    jrw = data
    jjc = data
    if(!is.null(input$jyear)){
      jye = subset(data, data$Working_Year == input$jyear)
    }
    if(!is.null(input$jexp)){
      jex = subset(data, data$Experience == input$jexp)
    }
    if(!is.null(input$jsts)){
      jst = subset(data, data$Employment_Status == input$jsts)
    }
    if(!is.null(input$jcsize)){
      jcs = subset(data, data$Company_Size == input$jcsize)
    }
    if(!is.null(input$jrwr)){
      jrw = subset(data, data$Remote_Working_Ratio == input$jrwr)
    }
    if(!is.null(input$jjcat)){
      jjc = subset(data, data$DesignationCategory == input$jjcat)
    }
    
    dfs = list(jye, jex, jst, jcs, jrw, jjc)
    
    jdata = Reduce(function(x, y) merge(x, y, by = "X", all = FALSE), dfs)
    
    jdata = jdata[, !(names(jdata) %in% c("X","Salary_In_Rupees.x"))]
    jdata = jdata[,1:10]
    colnames(jdata) = c("Year","Job Title","Experience","Emp Status","Emp Location","Comp Location","Comp Size","RWR","Job Category","Salary")
    datatable(jdata, options = list(pageLength = 15))
  })
  
  output$description <- renderImage({
    
    
    list(src = "../Data_Science_Salary_Dashboard/resources/description.jpeg",
         contentType = 'image/png',
         width = 500,
         height = 300,
         alt = "This is alternate text")
  })
  
  
  
  
}
