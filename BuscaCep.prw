#Include 'Protheus.ch'

User Function BuscaCep()
	Local cCep := "http://cep.republicavirtual.com.br/web_cep.php?cep=68906844&formato=json"
	Local cWeb := ""
	Local cError := ""
	Local cWarning := ""
	
	Local oXml := NIL
	Local oJson := NIL
	
	cWeb := HTTPGET(cCep)
	
	//oXml := XmlParser( cWeb, "_", @cError, @cWarning )
	
	If FWJsonDeserialize(cWeb, @oJson)
		MsgInfo(oJson:BAIRRO)
	Else
		MsgInfo("Erro no parse da URL")
	Endif
	
	//Msginfo(oXml:_webservicecep:_bairro:TEXT)
Return

