library(shiny)
library(echarts4r)

ui <- fluidPage(
  fluidRow(
    column(3, echarts4rBoxOutput("box1")),
    column(3, echarts4rBoxOutput("box2")),
    column(3, echarts4rBoxOutput("box3")),
    column(3, echarts4rBoxOutput("box4"))
  )
)

server <- function(input, output){
  output$box1 <- renderEcharts4rBox({
    echarts4rBox(cars, speed, dist, "Cake", type = "bar")
  })

  output$box2 <- renderEcharts4rBox({
    echarts4rBox(cars, speed, dist, "Pears", type = "area")
  })

  output$box3 <- renderEcharts4rBox({
    echarts4rBox(cars, speed, dist, "More Cakes!", type = "step")
  })

  output$box4 <- renderEcharts4rBox({
    echarts4rBox(cars, dist, speed, "Misc", type = "scatter", title_args = list(left = "right"))
  })
}

shinyApp(ui, server)