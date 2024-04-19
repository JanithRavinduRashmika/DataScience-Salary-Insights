library(shiny)
library(shinydashboard)
library(wordcloud2)
library(DT)


shinyUI(
  dashboardPage(
    dashboardHeader(title = "DS Salary"),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Dashboard", tabName = "dashboard"),
        menuItem("Database", tabName = "database"),
        menuItem("Description", tabName = "description")
      )
    ),
    dashboardBody(
      tabItems(
        tabItem(
          tabName = "dashboard",
          fluidRow(
            style = "display: flex; justify-content: space-between;",
            valueBoxOutput("numEmp",width = 2),
            valueBoxOutput("numJobTitle",width = 2),
            valueBoxOutput("avgSalary",width = 3),
            valueBoxOutput("numCompanyBasedCountries",width = 2),
            valueBoxOutput("numEmpCountries",width = 2)
          ),
          fluidRow(
            
            box(
              style = "height: 550px;",
              title = "Most Popular Job Titles", solidHeader = T, status = "primary",
              selectInput("wcyear", "Year", choices = c("All","2020","2021","2022") ),
              hr(),
              wordcloud2Output("wordCloud"),
              
            ),
            
            
            box(
              style = "height: 550px;",
              title = "Global Overview of Employees and Companies", solidHeader = T, status = "primary",
              tabsetPanel(
                type = "tab",
                tabPanel("Employee",br(),
                         fluidRow(
                           column(6,selectInput("empyear", "Year", choices = c("All","2020","2021","2022") )),
                           column(6,selectInput("empJcat", "Job Category", choices = c("All","Data Analyst","Data Scientist","Data Engineer","ML Engineer","AI Engineer") ))
                           
                         ),
                         plotOutput("empDis")),
                tabPanel("Company",br(),
                         fluidRow(
                           column(6,selectInput("cmpyear", "Year", choices = c("All","2020","2021","2022") )),
                           column(6,selectInput("cmpJcat", "Job Category", choices = c("All","Data Analyst","Data Scientist","Data Engineer","ML Engineer","AI Engineer") ))
                           
                         ),
                         plotOutput("cmpDis")),
              )
            )
            
            
          ),
          fluidRow(
            box(
              title = "Average Salary over years", solidHeader = T, status = "primary",
              selectInput("avgSal", "Job Category", choices = c("All","AI Engineer","Data Analyst","Data Engineer","Data Scientist","ML Engineer") ),
              hr(),
              plotOutput("avgSalPlot")
              
            )
          )
        ),
        tabItem(
          tabName = "database",
          fluidRow(
            column(4,selectInput("jyear", "Year", choices = c("2020","2021","2022"),multiple = T )),
            column(4,selectInput("jexp", "Experience", choices = c("EN","MI","SE","EX") ,multiple = T )),
            column(4,selectInput("jsts", "Employee Status", choices = c("FT","PT","CT","FL") ,multiple = T )),
            column(4,selectInput("jcsize", "Company Size", choices = c("S","M","L") ,multiple = T )),
            column(4,selectInput("jrwr", "Remote Working Ratio", choices = c("0","50","100") ,multiple = T )),
            column(4,selectInput("jjcat", "Job Category", choices = c("AI Engineer","Data Analyst","Data Engineer","Data Scientist","ML Engineer") ,multiple = T )),
            
          ),
          fluidRow(
            box(
              width = 12,
              height = 750,
              dataTableOutput("dataTable")
            )
          )
          
        ),
        tabItem(
          tabName = "description",
          fluidRow(
            box(
              width = 12,
              h1("Data Science Salary 2023"),
              hr(),
              imageOutput("description",height = "300px"),
              br(),br(),
              p('The "Data Science Salaries 2023" dataset provides comprehensive information on salaries in the field of data science for the year 2020 to 2022. This dataset offers valuable insights into the compensation packages received by professionals working in the data science domain. The data includes various attributes such as job title, years of experience, education level, industry, location, and salary details.'),
              br(),
              p("Understanding the salary trends and factors influencing compensation in the data science industry is crucial for professionals, employers, and policymakers alike. By analyzing this dataset, one can gain insights into the average salaries, salary distributions, and the impact of different factors on compensation levels within the data science field. Additionally, this dataset can be utilized to identify salary disparities across different demographics, geographical regions, and industries within the data science profession."),
              br(),
              p("This dataset is a valuable resource for data scientists, researchers, recruiters, and policymakers interested in exploring salary trends and patterns within the data science industry. It can be used for conducting statistical analyses, building predictive models, and informing decision-making processes related to workforce management, talent acquisition, and salary benchmarking in the field of data science."),
              br(),
              p("Data Science Job Salaries Dataset contains 11 columns, each are:"),
              tags$ol(tags$li("Work_Year: The year the salary was paid."),
                      tags$li("Designation: The role worked in during the year"),
                      tags$li("Experience: The experience level in the job during the year"),
                      tags$li("Employment_Status: The type of employment for the role"),
                      tags$li("Salary_In_Rupees: The total gross salary amount paid."),
                      tags$li("Employee_Location:  Employee's primary country of residence."),
                      tags$li("Company_Location: The country of the employer's main office."),
                      tags$li("Company_Size: The size of the company"),
                      tags$li("Remote_Working_Ratio: The overall amount of work done remotely")
                      
              )
            )
            
          ),
          
        )
      )
    )
  )
)
