library("shiny")
library("ggplot2")

shinyServer(function(input, output) {

Data<-reactive({data.frame(
	Kategorien=round(rnorm(input$N,50,input$Var))
)})
output$grafik<-renderPlot({
	P<-ggplot(
		Data(),
		aes(x=Kategorien),
		ylab="Häufigkeit",
	) + stat_bin(
	geom=input$grafik,
	color="darkblue",
	fill="white",
	binwidth=input$Klassenbreite
	) + geom_vline(
		xintercept=mean(Data()$Kategorien),
		color="red",
		linetype="dashed",
		size=1
	)
	print(P)
})
})