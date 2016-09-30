#Include 'Protheus.ch'
#Include 'ApWebSrv.ch'

WsService xDADOSPRODUTO Description 'Informação do produto - B1'
	WsData Produto       As String
	WsData nSaldo        As Float
	WsData EmpFilial     As String Optional
	WsData aListaProduto As Array Of TabelaSB1
	
	WsMethod SaldoEstoque  Description 'Retorna o saldo do produto em estoque'
	WsMethod ListaProduto  Description 'Lista o produto'
	WsMethod ListaTodosProdutos Description 'Retorna todos os produtos'
EndWsService 

WsStruct TabelaSB1
	WsData B1_COD    As String
	WsData B1_DESC   As String
	WsData B1_UM     As String
	WsData B1_TIPO   As String
	WsData B1_LOCPAD As String
	WsData B1_MSBLQL As String
EndWsStruct

WsMethod ListaTodosProdutos WsReceive Produto WsSend aListaProduto WsService xDADOSPRODUTO
	Local nIndice := 0
	DbSelectArea("SB1")
	
	While SB1->(!EOF())
		nIndice += 1
		aAdd(aListaProduto, WsClassNew("TabelaSB1"))
		aListaProduto[nIndice]:B1_COD    := SB1->B1_COD
		aListaProduto[nIndice]:B1_DESC   := SB1->B1_DESC
		aListaProduto[nIndice]:B1_UM 	   := SB1->B1_UM
		aListaProduto[nIndice]:B1_TIPO   := SB1->B1_TIPO
		aListaProduto[nIndice]:B1_LOCPAD := SB1->B1_LOCPAD
		aListaProduto[nIndice]:B1_MSBLQL := SB1->B1_MSBLQL
		SB1->(DBSKIP())
	End
	
Return .T.

WsMethod SaldoEstoque WsReceive Produto WsSend nSaldo WsService xDADOSPRODUTO
	DbSelectArea("SB2")
	SB2->(DbSetOrder(1))
	If SB2->( MsSeek(xFilial("SB2") + Produto))
		::nSaldo := (SB2->B2_QATU - SB2->B2_RESERVA - SB2->B2_QEMP)
	Else
		SetSoapFault("Dados do produto inválido", "Produto não localizado")
		Return .F.
	Endif
Return .T.


WsMethod ListaProduto WsReceive Produto WsSend aListaProduto WsService xDADOSPRODUTO
	DbSelectArea("SB1")
	SB1->(DbSetOrder(1))
	If SB1->( MsSeek(xFilial("SB1") + Produto))
		aAdd(aListaProduto, WsClassNew("TabelaSB1"))
		::aListaProduto[1]:B1_COD    := SB1->B1_COD
		::aListaProduto[1]:B1_DESC   := SB1->B1_DESC
		::aListaProduto[1]:B1_UM 	 := SB1->B1_UM
		::aListaProduto[1]:B1_TIPO   := SB1->B1_TIPO
		::aListaProduto[1]:B1_LOCPAD := SB1->B1_LOCPAD
		::aListaProduto[1]:B1_MSBLQL := SB1->B1_MSBLQL 
	Else
		SetSoapFault("Dados do produto inválido", "Produto não localizado")
		Return .F.
	Endif
Return .T.