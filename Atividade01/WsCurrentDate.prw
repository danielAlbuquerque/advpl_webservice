#Include 'Protheus.ch'
#Include 'ApWebSRV.ch'

WsService xCurrentDate Description "Mostra a DATA Atual"
	WsData DT As String
	WsData PARAMETRO As String
	
	WsMethod MostraData Description "DATA ATUAL"
	
EndWsService

WsMethod MostraData WsReceive PARAMETRO WsSend DT WsService xCurrentDate
	Local lRet := .F.
	
	If PARAMETRO == "123456"
		::DT := Dtoc(Date())
		lRet := .T.
	Else
		SetSoapFault("Method MostraData não Disponível", "Informar o param")
	Endif
	
Return lRet