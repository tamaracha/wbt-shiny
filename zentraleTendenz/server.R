library(shiny)

shinyServer(function(input, output, session) {
output$SummeHelp<-renderUI({
	input$updatehelp
	isolate({
		if(input$Summe==sum(random())){helpText("richtig")}
		else(helpText("noch nicht richtig"))
	})
})
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
		if(input$mw==round(mean(random()),digits=2)){helpText("richtig")}
		else(helpText("noch nicht richtig"))
	})
})
summa<-reactive({
	n<-length(random())
	switch(input$Summenaufgabe,
		"0"=1:n,
		"1"=2:n,
		"2"=1:(n-1)
	)
})
output$summe2Help<-renderUI({
		input$updatehelp
		isolate({
		if(input$summe2==sum(random()[summa()])){helpText("Richtig!")}
		else(helpText("noch nicht richtig"))
	})
})
output$mdHelp<-renderUI({
		input$updatehelp
		isolate({
		if(input$md==median(random())){helpText("Richtig!")}
		else(helpText("noch nicht richtig"))
	})
})
output$oddevenHelp<-renderUI({
		input$updatehelp
		isolate({
		if(input$oddeven==length(random())%%2){helpText("Richtig!")}
		else(helpText("Bitte auswählen"))
	})
})
output$mdrangeHelp<-renderUI({
	input$updatehelp
	isolate({
		if(input$mdrange[1]==length(random())/2&&input$mdrange[2]==length(random())/2+1){helpText("Richtig!")}
		else(helpText("noch nicht richtig"))
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
		inputId="Summe",
		value=0,
	)
	updateNumericInput(
		session,
		inputId="mw",
		value=0
	)
	updateNumericInput(
		session,
		inputId="summe2",
		value=0
	)
	updateRadioButtons(
		session,
		inputId="oddeven",
		selected=2
	)
	updateSliderInput(
		session,
		inputId="mdrange",
		value=c(1,10)
	)
	updateNumericInput(
		session,
		inputId="md",
		value=0
	)

	n<-sample(x=8:12,size=1)
	sample(size=n,x=1:10, replace=T)
})
output$tabelle<-renderTable({
	T<-data.frame(
		Werte=random()
	)
	if(input$sort){
		T<-data.frame(
			Werte=sort(random())
		)
	}
	T
})
})