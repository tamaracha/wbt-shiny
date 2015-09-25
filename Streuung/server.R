library(shiny)

shinyServer(function(input, output, session) {
output$nHelp<-renderUI({
		input$updatehelp
		isolate({
		if(input$n==length(random())){helpText("richtig")}
		else(helpText("noch nicht richtig"))
	})
})
output$mwHelp<-renderUI({
		input$updatehelp
		isolate({
		if(input$mw>=(mean(random())+0.1)||input$mw<=(mean(random())-0.1)){helpText("noch nicht richtig")}
		else(helpText("richtig"))
	})
})
output$SummeHelp<-renderUI({
		input$updatehelp
		isolate({
		if(
			input$Summe>=(sum((random() - mean(random()))^2)+0.1)||input$Summe<=(sum((random() - mean(random()))^2)-0.1)
		){helpText("noch nicht richtig")}
		else(helpText("richtig"))
	})
})
output$varHelp<-renderUI({
	input$updatehelp
	isolate({
		if(
			input$varianz>=(var(random())*(length(random())-1)/length(random())+0.1)||input$varianz<=(var(random())*(length(random())-1)/length(random())-0.1)
		){helpText("noch nicht richtig")}
		else(helpText("richtig"))
	})
})
output$sdHelp<-renderUI({
		input$updatehelp
		isolate({
		if(
			input$sd>=(sqrt(var(random())*(length(random())-1)/length(random()))+0.1)||input$sd<=(sqrt(var(random())*(length(random())-1)/length(random()))-0.1)
		){helpText("noch nicht richtig")}
		else(helpText("richtig"))
	})
})

random<-reactive({
	input$neu

	updateNumericInput(
		session,
		inputId="n",
		value=7
	)
	updateNumericInput(
		session,
		inputId="mw",
		value=0
	)
	updateNumericInput(
		session,
		inputId="Summe",
		value=0
	)
	updateNumericInput(
		session,
		inputId="varianz",
		value=0
	)
	updateNumericInput(
		session,
		inputId="sd",
		value=0
	)

	n<-sample(x=8:12,size=1)
	sample(size=n,x=1:10, replace=T)
})
output$tabelle<-renderTable({
	data.frame(
		Werte=random()
	)
})
output$tabelle2<-renderTable({
	data.frame(Werte=random())
})
output$sorttabelle<-renderTable({
	data.frame(
		Werte=sort(random())
	)
})
})