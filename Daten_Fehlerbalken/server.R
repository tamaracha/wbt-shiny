library(shiny)
library(reshape2)
library(plyr)
library(ggplot2)
Daten<-read.csv(file="Daten.csv")
Daten_melt<-melt(Daten,id.vars=c("id","Trainingsform"))
names(Daten_melt)<-c("id","Trainingsform","Zeitpunkt","Intelligenz")
levels(Daten_melt[,3])<-c("vorher","nachher")
Daten_sum<-ddply(
	Daten_melt,
	~Trainingsform+Zeitpunkt,
	Mittelwert=mean(Intelligenz),
	SEM=sd(Intelligenz)/sqrt(length(Intelligenz)),
	summarize
)

shinyServer(
function(input,output){
	output$data<-renderTable({
		Daten
	},caption.placement="top",caption="Denktrainingsdaten zur Bearbeitung der Aufgaben",include.rownames=F)
	output$downloaddata<-downloadHandler(filename="data.csv", content=function(file){write.csv2(data_dcast,file,row.names=F)})
	output$P<-renderPlot({
		pd<-position_dodge(.6)
		PP<-ggplot(
			Daten_sum,
			aes(x=Trainingsform,y=Mittelwert,shape=Zeitpunkt,group=Zeitpunkt,ymin=Mittelwert - 2*SEM,ymax=Mittelwert + 2*SEM)
		 ) + geom_errorbar(
			aes(width=.2),
			position=pd
		) + geom_point(
			position=pd
		) + labs(
			ylab="mittlere Intelligenz"
		)
		print(PP)
	})
}
)