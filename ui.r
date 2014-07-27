shinyUI(pageWithSidebar(
  headerPanel('Motor Trend Car Road Tests k-means clustering'),
  sidebarPanel(
    checkboxGroupInput("variable", "Variables to include",
                       c("Miles/(US) gallon" = "mpg", 
                         "Number of cylinders" = "cyl", 
                         "Displacement" = "disp", 
                         "Gross horsepower" = "hp",
                         "Rear axle ratio" = "drat",
                         "Weight (lb/1000)" = "wt",
                         "1/4 mile time" = "qsec",
                         "V/S" = "vs",
                         "Transmission" = "am",
                         "Number of forward gears" = "gear",
                         "Number of carburetors" = "carb"
                         )),

    numericInput('clusters', 'Cluster count', 3,
                 min = 1, max = 9)
  ),
  mainPanel(
    plotOutput('plot1'),
    plotOutput('plot2'),
    plotOutput('plot3')
  )
))