#Include 'Protheus.ch'

User Function DadosTime()
	Local oXML := nil
	oXML := WSXSERVERTIME():NEW()
	oXML:MOSTRAHORA("123456")
	Msginfo(oXML:cMOSTRAHORARESULT)

Return

