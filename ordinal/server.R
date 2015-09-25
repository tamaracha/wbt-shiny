require("shiny")
require("ggplot2")
require(plyr)

Noten<-c("sehr gut","gut","befriedigend","ausreichend","mangelhaft","schlecht")
Kategorien<-c("zart-bitter","Nougat","weiß","Krokant","bitter")

shinyServer(function(input, output) {
stichprobe<-reactive({
	input$neu
	data.frame(
		Teilnehmer=1:100,
		Note=factor(sample(Noten,size=100, replace=T),levels=Noten,ordered=T),
		Schokolade=factor(sample(Kategorien,size=100,replace=T),levels=Kategorien)
	)
})

output$balkenPlot<-renderPlot({
	P<-ggplot(
		data=stichprobe(),
		aes_string(x=input$x,fill=input$fill)
	) + geom_bar(
		width=.5,
		color="black",
		position=input$pos
	)
	if(input$fill==input$x||input$fill=="'#DD8888'"){
		P<-P+guides(fill=F)
	}
	if(input$flip=="Balken"){
		P<-P+coord_flip()
	}
	if(input$x=="factor(1)"){
		P<-P+scale_x_discrete(
			breaks=NULL
		) + theme(
			axis.title.x=element_blank()
		)
	}
	if(input$pos=="fill"){
		P+ylab("relative Häufigkeiten")
	}
	else(P+ylab("absolute Häufigkeiten"))
	print(P)
})

output$werte<-renderTable({
	table(stichprobe()[,3:2])
},caption.placement="top",caption="absolute Häufigkeiten der Kombinationen aus Note und Schokoladenpräferenz")

})