library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Iris Flowers Classification"),
    sidebarPanel(
        h4('Use the sliders or enter directly the measures for sepal and petal, in order to get the classification of your iris : '),
        numericInput("sl",label = "Enter Sepal Length", value = 4.3, min = 4.3, max = 8, step = 0.1 ),
        numericInput("sw",label = "Enter Sepal Width", value = 2, min = 2, max = 4.4, step = 0.1  ),
        numericInput("pl",label = "Enter Petal Length", value = 1, min = 1, max = 6.9, step = 0.1  ),
        numericInput("pw",label = "Enter Petal Width", value = 0.1, min = 0.1, max = 2.5, step = 0.1  )
    ),
    mainPanel(
        h3('The classification for the iris flower, with the data you entered is: '),
        
        verbatimTextOutput("cat")
    )
))