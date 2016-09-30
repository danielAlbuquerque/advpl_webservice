#Include 'Protheus.ch'

User Function BuscaData()
	Local oXML := nil
	oXML := WSXCURRENTDATE():NEW()
	oXML:MOSTRADATA("123456")
	Msginfo(oXML:cMOSTRADATARESULT)
Return

