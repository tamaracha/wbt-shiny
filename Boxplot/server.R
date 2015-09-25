library(shiny)
library(reshape2)
library(ggplot2)
Daten<-read.csv2(file="Daten.csv")
Daten_molten<-melt(Daten,id.vars=c(1,2),measure.vars=c(3,4),variable.name="Zeitpunkt",value.name="Intelligenz")
levels(Daten_molten[,3])<-c("vorher","nachher")

shinyServer(
function(input,output){
output$boxplot<-renderPlot({
	P<-ggplot(
		Daten_molten,
		aes_string(y="Intelligenz",x=input$Gruppe)
	) + geom_boxplot()
	if(input$flip=="horizontal"){
		P<-P+coord_flip()
	}
	print(P)
})
	output$data<-renderTable({
		Daten
	},caption.placement="top",caption="Denktrainingsdaten zur Bearbeitung der Aufgaben",include.rownames=F)
	output$downloaddata<-downloadHandler(filename="Datensatz.csv", content=function(file){write.csv2(Daten,file,row.names=F)}, contentType="text/csv")
}
)