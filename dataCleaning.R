###############################################################################
# Attach data set To working env
attach(originalDataSet)

dataSet = originalDataSet
################################################################################

#Changing empty value(-) to NA

dataSet[dataSet=="-"] = NA
################################################################################
#Categories work_year

dataSet$work_year = as.factor(dataSet$work_year)

summary(dataSet$work_year)

################################################################################
#Changing experience_level data to categories EN,EX,MI,SE

dataSet$experience_level[dataSet$experience_level == "Entry"] = "EN"
dataSet$experience_level[dataSet$experience_level == "Executive"] = "EX"
dataSet$experience_level[dataSet$experience_level == "Mid"] = "MI"
dataSet$experience_level[dataSet$experience_level == "Senior"] = "SE"


#Change experience_level into categorical variable
dataSet$experience_level = as.factor(dataSet$experience_level)

summary(dataSet$experience_level)
################################################################################

summary(as.factor(dataSet$employment_type))

#Changing employment_type data to categories CT,FL,FT,PT

dataSet$employment_type[dataSet$employment_type == "Contract"] = "CT"
dataSet$employment_type[dataSet$employment_type == "Freelance"] = "FL"
dataSet$employment_type[dataSet$employment_type == "Full-Time"] = "FT"
dataSet$employment_type[dataSet$employment_type == "Part-Time"] = "PT"

#Change employment_level into categorical variable
dataSet$employment_type = as.factor(dataSet$employment_type)

summary(dataSet$employment_type)
################################################################################
#Create new column call job_category with following job categories

#Data Scientist
#Data Analyst
#ML Engineer
#AI Engineer
#BI Analyst
#Data Engineer
#Data Architect
#Big Data Engineer
#Research Scientist

newJobTitle = dataSet$job_title
summary(as.factor(newJobTitle))



newJobTitle[newJobTitle == "Data Scientist"] = "Data Scientist"
newJobTitle[newJobTitle == "Data Science Manager"] = "Data Scientist"
newJobTitle[newJobTitle == "Data Science Consultant"] = "Data Scientist"
newJobTitle[newJobTitle == "Director of Data Science"] = "Data Scientist"
newJobTitle[newJobTitle == "Head of Data"] = "Data Scientist"
newJobTitle[newJobTitle == "Principal Data Scientist"] = "Data Scientist"
newJobTitle[newJobTitle == "Applied Data Scientist"] = "Data Scientist"
newJobTitle[newJobTitle == "Head of Data Science"] = "Data Scientist"
newJobTitle[newJobTitle == "Lead Data Scientist"] = "Data Scientist"
newJobTitle[newJobTitle == "Data Science Lead"] = "Data Scientist"
newJobTitle[newJobTitle == "Decision Scientist"] = "Data Scientist"
newJobTitle[newJobTitle == "Data Science Engineer"] = "Data Scientist"
newJobTitle[newJobTitle == "Data Lead"] = "Data Scientist"
newJobTitle[newJobTitle == "Data Strategist"] = "Data Scientist"
newJobTitle[newJobTitle == "Staff Data Scientist"] = "Data Scientist"
newJobTitle[newJobTitle == "Data Scientist Lead"] = "Data Scientist"
newJobTitle[newJobTitle == "Data Operations Manager"] = "Data Scientist"
newJobTitle[newJobTitle == "Data Science Tech Lead"] = "Data Scientist"
newJobTitle[newJobTitle == "Manager Data Science"] = "Data Scientist"
newJobTitle[newJobTitle == "Managing Director Data Science"] = "Data Scientist"
newJobTitle[newJobTitle == "Product Data Scientist"] = "Data Scientist"


newJobTitle[newJobTitle == "Data Analyst"] = "Data Analyst"
newJobTitle[newJobTitle == "Data Analytics Manager"] = "Data Analyst"
newJobTitle[newJobTitle == "Data Specialist"] = "Data Analyst"
newJobTitle[newJobTitle == "Lead Data Analyst"] = "Data Analyst"
newJobTitle[newJobTitle == "Data Quality Analyst"] = "Data Analyst"
newJobTitle[newJobTitle == "Product Data Analyst"] = "Data Analyst"
newJobTitle[newJobTitle == "Data Operations Analyst"] = "Data Analyst"
newJobTitle[newJobTitle == "Financial Data Analyst"] = "Data Analyst"
newJobTitle[newJobTitle == "Principal Data Analyst"] = "Data Analyst"
newJobTitle[newJobTitle == "Finance Data Analyst"] = "Data Analyst"
newJobTitle[newJobTitle == "Marketing Data Analyst"] = "Data Analyst"
newJobTitle[newJobTitle == "Data Analytics Lead"] = "Data Analyst"
newJobTitle[newJobTitle == "Data Analytics Engineer"] = "Data Analyst"
newJobTitle[newJobTitle == "Data Analytics Consultant"] = "Data Analyst"
newJobTitle[newJobTitle == "Data Analytics Specialist"] = "Data Analyst"
newJobTitle[newJobTitle == "Data Operations Specialist"] = "Data Analyst"
newJobTitle[newJobTitle == "Insight Analyst"] = "Data Analyst"
newJobTitle[newJobTitle == "Compliance Data Analyst"] = "Data Analyst"
newJobTitle[newJobTitle == "Staff Data Analyst"] = "Data Analyst"
newJobTitle[newJobTitle == "Analytics Engineering Manager"] = "Data Analyst"
newJobTitle[newJobTitle == "Data Visualization Analyst"] = "Data Analyst"
newJobTitle[newJobTitle == "Data Visualization Specialist"] = "Data Analyst"
newJobTitle[newJobTitle == "Sales Data Analyst"] = "Data Analyst"



newJobTitle[newJobTitle == "Machine Learning Engineer"] = "ML Engineer"
newJobTitle[newJobTitle == "ML Engineer"] = "ML Engineer"
newJobTitle[newJobTitle == "Computer Vision Engineer"] = "ML Engineer"
newJobTitle[newJobTitle == "Applied Machine Learning Scientist"] = "ML Engineer"
newJobTitle[newJobTitle == "Machine Learning Infrastructure Engineer"] = "ML Engineer"
newJobTitle[newJobTitle == "Machine Learning Software Engineer"] = "ML Engineer"
newJobTitle[newJobTitle == "NLP Engineer"] = "ML Engineer"
newJobTitle[newJobTitle == "Machine Learning Developer"] = "ML Engineer"
newJobTitle[newJobTitle == "Computer Vision Software Engineer"] = "ML Engineer"
newJobTitle[newJobTitle == "Deep Learning Engineer"] = "ML Engineer"
newJobTitle[newJobTitle == "MLOps Engineer"] = "ML Engineer"
newJobTitle[newJobTitle == "Lead Machine Learning Engineer"] = "ML Engineer"
newJobTitle[newJobTitle == "Machine Learning Manager"] = "ML Engineer"
newJobTitle[newJobTitle == "Head of Machine Learning"] = "ML Engineer"
newJobTitle[newJobTitle == "Principal Machine Learning Engineer"] = "ML Engineer"
newJobTitle[newJobTitle == "Applied Machine Learning Engineer"] = "ML Engineer"
newJobTitle[newJobTitle == "Machine Learning Specialist"] = "ML Engineer"
newJobTitle[newJobTitle == "Staff Machine Learning Engineer"] = "ML Engineer"


newJobTitle[newJobTitle == "AI Scientist"] = "AI Engineer"
newJobTitle[newJobTitle == "AI Developer"] = "AI Engineer"
newJobTitle[newJobTitle == "AI Programmer"] = "AI Engineer"
newJobTitle[newJobTitle == "AI Architect"] = "AI Engineer"
newJobTitle[newJobTitle == "Autonomous Vehicle Technician"] = "AI Engineer"


newJobTitle[newJobTitle == "BI Data Analyst"] = "BI Analyst"
newJobTitle[newJobTitle == "Business Data Analyst"] = "BI Analyst"
newJobTitle[newJobTitle == "BI Developer"] = "BI Analyst"
newJobTitle[newJobTitle == "BI Analyst"] = "BI Analyst"
newJobTitle[newJobTitle == "Business Intelligence Engineer"] = "BI Analyst"
newJobTitle[newJobTitle == "Business Intelligence Analyst"] = "BI Analyst"
newJobTitle[newJobTitle == "Business Intelligence Developer"] = "BI Analyst"
newJobTitle[newJobTitle == "BI Data Engineer"] = "BI Analyst"
newJobTitle[newJobTitle == "Business Intelligence Data Analyst"] = "BI Analyst"
newJobTitle[newJobTitle == "Power BI Developer"] = "BI Analyst"



newJobTitle[newJobTitle == "Data Engineer"] = "Data Engineer"
newJobTitle[newJobTitle == "Analytics Engineer"] = "Data Engineer"
newJobTitle[newJobTitle == "Data Manager"] = "Data Engineer"
newJobTitle[newJobTitle == "Lead Data Engineer"] = "Data Engineer"
newJobTitle[newJobTitle == "ETL Developer"] = "Data Engineer"
newJobTitle[newJobTitle == "Software Data Engineer"] = "Data Engineer"
newJobTitle[newJobTitle == "Data Operations Engineer"] = "Data Engineer"
newJobTitle[newJobTitle == "Cloud Data Engineer"] = "Data Engineer"
newJobTitle[newJobTitle == "Data Infrastructure Engineer"] = "Data Engineer"
newJobTitle[newJobTitle == "Cloud Database Engineer"] = "Data Engineer"
newJobTitle[newJobTitle == "Principal Data Engineer"] = "Data Engineer"
newJobTitle[newJobTitle == "Data Engineering Manager"] = "Data Engineer"
newJobTitle[newJobTitle == "Director of Data Engineering"] = "Data Engineer"
newJobTitle[newJobTitle == "ETL Engineer"] = "Data Engineer"
newJobTitle[newJobTitle == "Azure Data Engineer"] = "Data Engineer"
newJobTitle[newJobTitle == "Cloud Data Architect"] = "Data Engineer"
newJobTitle[newJobTitle == "Data DevOps Engineer"] = "Data Engineer"
newJobTitle[newJobTitle == "Data Integration Specialist"] = "Data Engineer"
newJobTitle[newJobTitle == "Data Management Specialist"] = "Data Engineer"
newJobTitle[newJobTitle == "Data Modeller"] = "Data Engineer"
newJobTitle[newJobTitle == "Data Architect"] = "Data Engineer"
newJobTitle[newJobTitle == "Data Modeler"] = "Data Engineer"
newJobTitle[newJobTitle == "AWS Data Architect"] = "Data Engineer"
newJobTitle[newJobTitle == "Consultant Data Engineer"] = "Data Engineer"
newJobTitle[newJobTitle == "Data Engineer 2"] = "Data Engineer"
newJobTitle[newJobTitle == "Data Quality Engineer"] = "Data Engineer"
newJobTitle[newJobTitle == "Manager Data Management"] = "Data Engineer"
newJobTitle[newJobTitle == "Marketing Data Engineer"] = "Data Engineer"
newJobTitle[newJobTitle == "Principal Data Architect"] = "Data Engineer"



newJobTitle[newJobTitle == "Big Data Engineer"] = "Big Data Engineer"
newJobTitle[newJobTitle == "Big Data Architect"] = "Big Data Engineer"


newJobTitle[newJobTitle == "Research Scientist"] = "Research Scientist"
newJobTitle[newJobTitle == "Applied Scientist"] = "Research Scientist"
newJobTitle[newJobTitle == "Research Engineer"] = "Research Scientist"
newJobTitle[newJobTitle == "Machine Learning Researcher"] = "Research Scientist"
newJobTitle[newJobTitle == "Machine Learning Research Engineer"] = "Research Scientist"
newJobTitle[newJobTitle == "3D Computer Vision Researcher"] = "Research Scientist"
newJobTitle[newJobTitle == "Research Analyst"] = "Research Scientist"
newJobTitle[newJobTitle == "Machine Learning Scientist"] = "Research Scientist"
newJobTitle[newJobTitle == "Deep Learning Researcher"] = "Research Scientist"

dataSet["job_category"] = as.factor(newJobTitle)


dataSet = dataSet[,c(1:4,12,5:11)]
dataSet

################################################################################
#Change employee_residence,company_location data to ISO alpha 2  country codes

dataSet[dataSet == "United States"] = "US"
dataSet[dataSet == "United Kingdom"] = "GB"
dataSet[dataSet == "Canada"] = "CA"
dataSet[dataSet == "Germany"] = "DE"
dataSet[dataSet == "India"] = "IN"
dataSet[dataSet == "Spain"] = "ES"
dataSet[dataSet == "France"] = "FR"
dataSet[dataSet == "Australia"] = "AU"
dataSet[dataSet == "Portugal"] = "PT"
dataSet[dataSet == "Netherlands"] = "NL"
dataSet[dataSet == "Brazil"] = "BR"
dataSet[dataSet == "Greece"] = "GR"
dataSet[dataSet == "Nigeria"] = "NG"
dataSet[dataSet == "Colombia"] = "CO"
dataSet[dataSet == "Italy"] = "IT"
dataSet[dataSet == "Mexico"] = "MX"
dataSet[dataSet == "Argentina"] = "AR"
dataSet[dataSet == "Japan"] = "JP"
dataSet[dataSet == "Ireland"] = "GB"
dataSet[dataSet == "Poland"] = "PL"
dataSet[dataSet == "Austria"] = "AT"
dataSet[dataSet == "Belgium"] = "BE"
dataSet[dataSet == "Turkey"] = "TR"
dataSet[dataSet == "Estonia"] = "EE"
dataSet[dataSet == "Pakistan"] = "PK"
dataSet[dataSet == "Puerto Rico"] = "PR"
dataSet[dataSet == "Singapore"] = "SG"
dataSet[dataSet == "Switzerland"] = "CH"
dataSet[dataSet == "Latvia"] = "LV"
dataSet[dataSet == "Russian Federation"] = "RU"
dataSet[dataSet == "Slovenia"] = "SI"
dataSet[dataSet == "Croatia"] = "HR"
dataSet[dataSet == "Denmark"] = "DK"
dataSet[dataSet == "Ghana"] = "GH"
dataSet[dataSet == "Hungary"] = "HU"
dataSet[dataSet == "Philippines"] = "PH"
dataSet[dataSet == "Romania"] = "RO"
dataSet[dataSet == "Thailand"] = "TH"
dataSet[dataSet == "Ukraine"] = "UA"
dataSet[dataSet == "United Arab Emirates"] = "AE"
dataSet[dataSet == "Uzbekistan"] = "UZ"
dataSet[dataSet == "Central African Republic"] = "CF"
dataSet[dataSet == "Chile"] = "CL"
dataSet[dataSet == "Egypt"] = "EG"
dataSet[dataSet == "Finland"] = "FI"
dataSet[dataSet == "Hong Kong"] = "HK"
dataSet[dataSet == "Lithuania"] = "LT"
dataSet[dataSet == "Norway"] = "NO"
dataSet[dataSet == "Saudi Arabia"] = "SA"
dataSet[dataSet == "Sweden"] = "SE"
dataSet[dataSet == "Algeria"] = "DZ"
dataSet[dataSet == "American Samoa"] = "AS"
dataSet[dataSet == "Andorra"] = "AD"
dataSet[dataSet == "Armenia"] = "AM"
dataSet[dataSet == "Bosnia and Herzegovina"] = "BA"
dataSet[dataSet == "Bulgaria"] = "BG"
dataSet[dataSet == "China"] = "CN"
dataSet[dataSet == "Costa Rica"] = "CR"
dataSet[dataSet == "Cyprus"] = "CY"
dataSet[dataSet == "Czechia"] = "CZ"
dataSet[dataSet == "Dominican Republic"] = "DO"
dataSet[dataSet == "Ecuador"] = "EC"
dataSet[dataSet == "Georgia"] = "GE"
dataSet[dataSet == "Honduras"] = "HN"
dataSet[dataSet == "Indonesia"] = "ID"
dataSet[dataSet == "Israel"] = "IL"
dataSet[dataSet == "Jersey"] = "JE"
dataSet[dataSet == "Kenya"] = "KE"
dataSet[dataSet == "Kuwait"] = "KW"
dataSet[dataSet == "Luxembourg"] = "LU"
dataSet[dataSet == "Malaysia"] = "MY"
dataSet[dataSet == "Malta"] = "MT"
dataSet[dataSet == "New Zealand"] = "NZ"
dataSet[dataSet == "Peru"] = "PE"
dataSet[dataSet == "Serbia"] = "RS"
dataSet[dataSet == "Viet Nam"] = "VN"
dataSet[dataSet == "South Africa"] = "ZA"
dataSet[dataSet == "Tunisia"] = "TN"
dataSet[dataSet == "Bolivia, Plurinational State of"] = "BO"
dataSet[dataSet == "Iran, Islamic Republic of"] = "IR"
dataSet[dataSet == "Iraq"] = "IQ"
dataSet[dataSet == "Korea, Republic of"] = "KP"
dataSet[dataSet == "Moldova, Republic of"] = "MD"
dataSet[dataSet == "Bahamas"] = "BS"

dataSet$employee_residence = as.factor(dataSet$employee_residence)
dataSet$company_location = as.factor(dataSet$company_location)
summary(dataSet$employee_residence)
summary(dataSet$company_location)

################################################################################
#Change company_size data to L,M,S categories

dataSet$company_size[dataSet$company_size == "Large"] = "L"
dataSet$company_size[dataSet$company_size == "Medium"] = "M"
dataSet$company_size[dataSet$company_size == "Small"] = "S"

dataSet$company_size = as.factor(dataSet$company_size)

summary(dataSet$company_size)

################################################################################



finalDataSet = dataSet[c("work_year","experience_level","employment_type",
                         "job_title","job_category","salary_in_usd",
                         "employee_residence","company_location","remote_ratio","company_size")]

################################################################################
#Find duplicated rows in data set

sum(duplicated(finalDataSet))

################################################################################
#Remove duplicated rows

finalDataSet = unique(finalDataSet)

################################################################################
#Sort data set respect to work_year

finalDataSet = finalDataSet[order(finalDataSet$work_year),]

################################################################################
#Create new csv fill

write.csv(finalDataSet,"DataScienceJobDomainSalaries.csv",row.names = F)

###############################################################################
#END!!!