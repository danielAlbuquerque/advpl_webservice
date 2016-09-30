#Include 'Protheus.ch'
#Include 'ApWebSRV.ch'

WsService xServerTime Description "Mostra HORA Atual"
	WsData HORARIO As String
	WsData PARAMETRO As String
	
	WsMethod MostraHora Description "Horário de Brasília"
	
EndWsService

WsMethod MostraHora WsReceive PARAMETRO WsSend HORARIO WsService xServerTime
	Local lRet := .F.
	
	If PARAMETRO == "123456"
		::HORARIO := Time()
		lRet := .T.
	Else
		SetSoapFault("Method MostraHora não Disponível", "Informar o param")
	Endif
	
Return lRet