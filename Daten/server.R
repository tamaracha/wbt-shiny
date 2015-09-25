library(shiny)
Daten<-read.csv2(file="Daten.csv")

shinyServer(
function(input,output){
	output$data<-renderTable({
		Daten
	},caption.placement="top",caption="Denktrainingsdaten zur Bearbeitung der Aufgaben",include.rownames=F)
	output$downloaddata<-downloadHandler(filename="Datensatz.csv", content=function(file){write.csv2(Daten,file,row.names=F)}, contentType="text/csv")
}
)