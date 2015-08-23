library(shiny)
library(caret)
library(randomForest)
library(e1071)
data(iris)
inTrain <- createDataPartition(y=iris$Species,p=0.7, list=FALSE)
training <- iris[inTrain,]
modFit <- train(Species~ .,data=training,method="rf",prox=TRUE)


getDataFrame <- function(input) {
    
    return (data.frame(
        Sepal.Length=as.numeric(c(input$sl)),
        Sepal.Width=as.numeric(c(input$sw)),
        Petal.Length=as.numeric(c(input$pl)),
        Petal.Width=as.numeric(c(input$pw))))
    
}

shinyServer(
    function(input, output) {
                
        predicted <- reactive({
            
            dataFrame <- getDataFrame(input)
            as.character(predict(modFit,dataFrame))
        })
        
        output$cat <- renderPrint({
                predicted()
        })
        
        
    }
)