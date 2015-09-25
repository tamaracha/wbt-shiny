library(shiny)
library(ggplot2)
Daten<-read.csv(file="Daten.csv")

shinyServer(
function(input,output){
	output$data<-renderTable({
		Daten
	},caption.placement="top",caption="Denktrainingsdaten zur Bearbeitung der Aufgaben",include.rownames=F)
	output$downloaddata<-downloadHandler(filename="data.csv", content=function(file){write.csv2(data_dcast,file,row.names=F)})
	output$P<-renderPlot({
		PP<-ggplot(
			Daten,
			aes(x=Intelligenz_vorher,y=Intelligenz_nachher,fill=Trainingsform)
		) + geom_point(
		) + geom_smooth(
			method=lm
		) + labs(
			x="Intelligenz vorher",
			y="Intelligenz nachher"
		)
		print(PP)
	})
}
)