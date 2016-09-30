#Include 'Protheus.ch'

User Function DadosSB1()
	Local oWS := nil
	Local aProduto := {}
	
	oWS := WSXDADOSPRODUTO():NEW()
	oWS:LISTATODOSPRODUTOS("")
	aProduto := oWS:oWSLISTATODOSPRODUTOSRESULT:oWSTABELASB1
	
	For x := 1 to len(aProduto)
		Msginfo(aProduto[x]:CB1_DESC)	
	Next
	
Return