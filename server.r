library(cluster)
library(fpc)
library(HSAUR)

shinyServer(function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    mtcars[, c(input$variable)]
  })
  
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  
  output$plot1 <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    clusplot(selectedData(), clusters()$cluster, color=TRUE, shade=TRUE, 
             labels=2, lines=0, main = NULL)
  })
  
  output$plot2 <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    points(clusters()$centers, pch = 2, cex = 2, lwd = 2)
  })
  
})