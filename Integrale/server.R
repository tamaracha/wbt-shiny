library("shiny")
library("ggplot2")
X <- seq(0,100,by=0.1)
Y<-dnorm(X,50,10)
data<-data.frame(X,Y)

shinyServer(function(input, output) {

output$t<-renderPlot({
X_poly<-c(X[(which(X==input$integral[1]))], X[(which(X==input$integral[2]))], X[(which(X==input$integral[2]))]:X[(which(X==input$integral[1]))])
Y_poly<-c(0,0,dnorm(X_poly[-c(1,2)],50,10))
data_poly<-data.frame(X_poly,Y_poly)
XY<-ggplot(
data,
aes(X, Y)
) + geom_path(
) + geom_polygon(
data=data_poly,
aes(X_poly, Y_poly,fill="blue")
) + scale_x_continuous(
"Ausprägungen",
limits=c(0,100),
breaks=seq(0,100,by=10),
minor_breaks=seq(0,100,by=2.5)
) + scale_y_continuous(
"Dichte"
) + guides(
	fill=F
)
print(XY)
})
output$IR<-renderText({
	c(input$integral[1],"—",input$integral[2])
})
output$IP<-renderText({
	c(round((pnorm(input$integral[2],50,10)-pnorm(input$integral[1],50,10))*100),"%")
})
})