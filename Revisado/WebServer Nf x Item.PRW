#INCLUDE "APWEBSRV.CH"
#INCLUDE "PROTHEUS.CH"

WsService _CMY522 Description "Consulta NFs"
	WsData cNOTAIn	 As String 	
	WsData cNOTAFn	 As String 		
	WsData cSERIE	 As String 	
	WSDATA aRetornos AS Array of aDados
    WsMethod ConsultaNfs Description "Consulta NFs"
EndWsService            

WSSTRUCT Cab
	WsData cCabFILIAL	As String
 	WsData cCabDOC		As String
 	WsData cCabSERIE	As String
 	WsData cCabEMISSAO	As String
 	WsData cCabCLIENTE	As String
	WsData aItens   As Array of Itens
ENDWSSTRUCT        

WSSTRUCT Itens
	WsData cItFILIAL	As String
 	WsData cItDOC		As String
 	WsData cItSERIE	As String
 	WsData cItCOD		As String
 	WsData nItQUANT	As Float
ENDWSSTRUCT        

WSSTRUCT aDados
	WsData Dados    As Array of Cab
ENDWSSTRUCT        

WsMethod ConsultaNfs WsReceive cNOTAIn,cNOTAFn,cSERIE WsSend aRetornos WsService _CMY522
		cQuery := ""
		cQuery += " SELECT F2_FILIAL, F2_DOC, F2_SERIE, F2_EMISSAO, F2_CLIENTE "
		cQuery += " FROM "+RetSqlName("SF2")+" "
		cQuery += " WHERE "
		cQuery += " F2_FILIAL = '01' " //passar filial
		cQuery += " AND F2_DOC >= '" + Alltrim(cNOTAIn) + "' "
		cQuery += " AND F2_DOC <= '" + Alltrim(cNOTAFn) + "' "
		cQuery += " AND F2_SERIE = '" + Alltrim(cSERIE) + "' "		
		cQuery += " AND D_E_L_E_T_ = '' "
	
		TMPCab := GetNextAlias()
		If Select("TMPCab")  > 0; TMPCab->(DbCloseArea()); EndIf
		dbUseArea(.T.,"TOPCONN",TCGenQry(,,cQuery),"TMPCab",.F.,.T.)

		cQuery := ""
		cQuery += " SELECT D2_FILIAL, D2_DOC, D2_SERIE, D2_COD, D2_QUANT "
		cQuery += " FROM "+RetSqlName("SD2")+" "
		cQuery += " WHERE "
		cQuery += " D2_FILIAL = '01' "  //passar filial
		cQuery += " AND D2_DOC >= '" + Alltrim(cNOTAIn) + "' "
		cQuery += " AND D2_DOC <= '" + Alltrim(cNOTAFn) + "' "
		cQuery += " AND D2_SERIE = '" + Alltrim(cSERIE) + "' "		
		cQuery += " AND D_E_L_E_T_ = '' "
	
		TMPIt := GetNextAlias()
		If Select("TMPIt")  > 0; TMPIt->(DbCloseArea()); EndIf
		dbUseArea(.T.,"TOPCONN",TCGenQry(,,cQuery),"TMPIt",.F.,.T.)
	    nX := 0        
		Do While !TMPCab->(Eof())
			oTemp:= WsClassNew("aDados")
			oTemp:Cab:cCabFILIAL := TMPCab->F2_FILIAL
			oTemp:Cab:cCabDOC    := TMPCab->F2_DOC
			oTemp:Cab:cCabSERIE  := TMPCab->F2_SERIE
			oTemp:Cab:cCabEMISSAO:= TMPCab->F2_EMISSAO
			oTemp:Cab:cCabCLIENTE:= TMPCab->F2_CLIENTE

			Do While !TMPIt->(Eof()) .and. (TMPCab->F2_DOC == TMPIt->D2_DOC) .and. (TMPCab->F2_SERIE == TMPIt->D2_SERIE)
				nX++
				oTemp:aItens[nX]:cItFILIAL	 := TMPIt->D2_FILIAL
				oTemp:aItens[nX]:cItDOC		 := TMPIt->D2_DOC
				oTemp:aItens[nX]:cItSERIE	 := TMPIt->D2_SERIE
				oTemp:aItens[nX]:cItCOD	 	 := TMPIt->D2_COD
				oTemp:aItens[nX]:nItQUANT	 := TMPIt->D2_QUANT
			TMPIt->(Dbskip())
			EndDo
			            
			aAdd (::aRetornos,oTemp)
		TMPCab->(Dbskip())
		EndDo
	
Return .T.


