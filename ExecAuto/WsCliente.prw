#Include 'Protheus.ch'
#Include 'ApWebSrv.ch'

WsService xDadosCliente Description "Informação Cliente - SA1"
	WsData GravaCliente As TECLIENTE
	WsData cID          As String
	WsData Msg          As String
	
	WsMethod INCLUIR Description "Inserir um novo cliente"
EndWsService

WsStruct TECLIENTE
	WsData A1_COD    as String
	WsData A1_LOJA   as String
	WsData A1_NOME   as String
	WsData A1_NREDUZ as String
	WsData A1_MUN 	 as String
	WsData A1_TIPO   as String
	WsData A1_EST    as String
	WsData A1_END    as String
EndWsStruct


WsMethod INCLUIR WsReceive GravaCliente WsSend Msg WsService xDadosCliente
	Local aDados := {}
	Private lMsErroAuto  := .F.
	
	aDados := { { "A1_COD",    GravaCliente:A1_COD, NIL },;
				   { "A1_LOJA",   GravaCliente:A1_LOJA, NIL },;
				   { "A1_NOME",   GravaCliente:A1_NOME, NIL },;
				   { "A1_NREDUZ", GravaCliente:A1_NREDUZ, NIL },;
				   { "A1_MUN",    GravaCliente:A1_MUN, NIL },;
				   { "A1_TIPO",   GravaCliente:A1_TIPO,  NIL },;
				   { "A1_END",   GravaCliente:A1_END,  NIL },;
				   { "A1_EST",    GravaCliente:A1_EST, NIL } }
				 
	MsExecAuto({|x,y| MATA030(x,y)}, aDados, 3)
	
	
	If lMsErroAuto
		::Msg := MostraErro()
	Else
		::Msg := "OK"
	EndIf
	
Return .T. 
