require(shiny)
require(ggplot2)
require(plyr)

Kategorien<-c("zart-bitter","Nougat","weiß","Krokant","bitter")

shinyServer(function(input, output) {
stichprobe<-reactive({
	input$neu
	data.frame(
		Teilnehmer=1:100,
		Schokoladenpräferenz=factor(sample(Kategorien,size=100, replace=T),levels=Kategorien,ordered=F)
	)
})

output$tortenPlot<-renderPlot({
	P<-ggplot(
		data=stichprobe(),
		aes(x=factor(1),fill=Schokoladenpräferenz,)
	) + geom_bar(
		width=1,
		color="black"
	) + coord_polar(
		theta="y"
	) + theme(
		axis.title.x=element_blank(),
		axis.title.y=element_blank()
	) +scale_x_discrete(
		breaks=NULL
	)
print(P)
})

output$stapelPlot<-renderPlot({
	S<-ggplot(
		data=stichprobe(),
		aes(x=factor(1),fill=Schokoladenpräferenz)
	) + geom_bar(
		width=0.1,
		color="black",
		) + theme(
			axis.title.x=element_blank()
	) + scale_x_discrete(
		breaks=NULL
	) + ylab(
		"Häufigkeit"
	)
	print(S)
})

output$werte<-renderTable({
	ddply(
		stichprobe(),
		.(Schokoladenpräferenz),
		absolut=length(Schokoladenpräferenz),
		relativ=length(Schokoladenpräferenz)/100,
		summarise
	)
},
	caption="absolute und relative Häufigkeiten der Schokoladenpräferenzen",
	caption.placement="top",
	include.rownames=F
)

})