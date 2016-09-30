#INCLUDE "PROTHEUS.CH"
#INCLUDE "APWEBSRV.CH"

/* ===============================================================================
WSDL Location    http://localhost:8081/ws/XDADOSPRODUTO.apw?WSDL
Gerado em        09/27/16 15:44:44
Observações      Código-Fonte gerado por ADVPL WSDL Client 1.120703
                 Alterações neste arquivo podem causar funcionamento incorreto
                 e serão perdidas caso o código-fonte seja gerado novamente.
=============================================================================== */

User Function _JBYCIBW ; Return  // "dummy" function - Internal Use 

/* -------------------------------------------------------------------------------
WSDL Service WSXDADOSPRODUTO
------------------------------------------------------------------------------- */

WSCLIENT WSXDADOSPRODUTO

	WSMETHOD NEW
	WSMETHOD INIT
	WSMETHOD RESET
	WSMETHOD CLONE
	WSMETHOD LISTAPRODUTO
	WSMETHOD LISTATODOSPRODUTOS
	WSMETHOD SALDOESTOQUE

	WSDATA   _URL                      AS String
	WSDATA   _HEADOUT                  AS Array of String
	WSDATA   _COOKIES                  AS Array of String
	WSDATA   cPRODUTO                  AS string
	WSDATA   oWSLISTAPRODUTORESULT     AS XDADOSPRODUTO_ARRAYOFTABELASB1
	WSDATA   oWSLISTATODOSPRODUTOSRESULT AS XDADOSPRODUTO_ARRAYOFTABELASB1
	WSDATA   nSALDOESTOQUERESULT       AS float

ENDWSCLIENT

WSMETHOD NEW WSCLIENT WSXDADOSPRODUTO
::Init()
If !FindFunction("XMLCHILDEX")
	UserException("O Código-Fonte Client atual requer os executáveis do Protheus Build [7.00.131227A-20160510 NG] ou superior. Atualize o Protheus ou gere o Código-Fonte novamente utilizando o Build atual.")
EndIf
Return Self

WSMETHOD INIT WSCLIENT WSXDADOSPRODUTO
	::oWSLISTAPRODUTORESULT := XDADOSPRODUTO_ARRAYOFTABELASB1():New()
	::oWSLISTATODOSPRODUTOSRESULT := XDADOSPRODUTO_ARRAYOFTABELASB1():New()
Return

WSMETHOD RESET WSCLIENT WSXDADOSPRODUTO
	::cPRODUTO           := NIL 
	::oWSLISTAPRODUTORESULT := NIL 
	::oWSLISTATODOSPRODUTOSRESULT := NIL 
	::nSALDOESTOQUERESULT := NIL 
	::Init()
Return

WSMETHOD CLONE WSCLIENT WSXDADOSPRODUTO
Local oClone := WSXDADOSPRODUTO():New()
	oClone:_URL          := ::_URL 
	oClone:cPRODUTO      := ::cPRODUTO
	oClone:oWSLISTAPRODUTORESULT :=  IIF(::oWSLISTAPRODUTORESULT = NIL , NIL ,::oWSLISTAPRODUTORESULT:Clone() )
	oClone:oWSLISTATODOSPRODUTOSRESULT :=  IIF(::oWSLISTATODOSPRODUTOSRESULT = NIL , NIL ,::oWSLISTATODOSPRODUTOSRESULT:Clone() )
	oClone:nSALDOESTOQUERESULT := ::nSALDOESTOQUERESULT
Return oClone

// WSDL Method LISTAPRODUTO of Service WSXDADOSPRODUTO

WSMETHOD LISTAPRODUTO WSSEND cPRODUTO WSRECEIVE oWSLISTAPRODUTORESULT WSCLIENT WSXDADOSPRODUTO
Local cSoap := "" , oXmlRet

BEGIN WSMETHOD

cSoap += '<LISTAPRODUTO xmlns="http://localhost:8081/">'
cSoap += WSSoapValue("PRODUTO", ::cPRODUTO, cPRODUTO , "string", .T. , .F., 0 , NIL, .F.) 
cSoap += "</LISTAPRODUTO>"

oXmlRet := SvcSoapCall(	Self,cSoap,; 
	"http://localhost:8081/LISTAPRODUTO",; 
	"DOCUMENT","http://localhost:8081/",,"1.031217",; 
	"http://localhost:8081/ws/XDADOSPRODUTO.apw")

::Init()
::oWSLISTAPRODUTORESULT:SoapRecv( WSAdvValue( oXmlRet,"_LISTAPRODUTORESPONSE:_LISTAPRODUTORESULT","ARRAYOFTABELASB1",NIL,NIL,NIL,NIL,NIL,NIL) )

END WSMETHOD

oXmlRet := NIL
Return .T.

// WSDL Method LISTATODOSPRODUTOS of Service WSXDADOSPRODUTO

WSMETHOD LISTATODOSPRODUTOS WSSEND cPRODUTO WSRECEIVE oWSLISTATODOSPRODUTOSRESULT WSCLIENT WSXDADOSPRODUTO
Local cSoap := "" , oXmlRet

BEGIN WSMETHOD

cSoap += '<LISTATODOSPRODUTOS xmlns="http://localhost:8081/">'
cSoap += WSSoapValue("PRODUTO", ::cPRODUTO, cPRODUTO , "string", .T. , .F., 0 , NIL, .F.) 
cSoap += "</LISTATODOSPRODUTOS>"

oXmlRet := SvcSoapCall(	Self,cSoap,; 
	"http://localhost:8081/LISTATODOSPRODUTOS",; 
	"DOCUMENT","http://localhost:8081/",,"1.031217",; 
	"http://localhost:8081/ws/XDADOSPRODUTO.apw")

::Init()
::oWSLISTATODOSPRODUTOSRESULT:SoapRecv( WSAdvValue( oXmlRet,"_LISTATODOSPRODUTOSRESPONSE:_LISTATODOSPRODUTOSRESULT","ARRAYOFTABELASB1",NIL,NIL,NIL,NIL,NIL,NIL) )

END WSMETHOD

oXmlRet := NIL
Return .T.

// WSDL Method SALDOESTOQUE of Service WSXDADOSPRODUTO

WSMETHOD SALDOESTOQUE WSSEND cPRODUTO WSRECEIVE nSALDOESTOQUERESULT WSCLIENT WSXDADOSPRODUTO
Local cSoap := "" , oXmlRet

BEGIN WSMETHOD

cSoap += '<SALDOESTOQUE xmlns="http://localhost:8081/">'
cSoap += WSSoapValue("PRODUTO", ::cPRODUTO, cPRODUTO , "string", .T. , .F., 0 , NIL, .F.) 
cSoap += "</SALDOESTOQUE>"

oXmlRet := SvcSoapCall(	Self,cSoap,; 
	"http://localhost:8081/SALDOESTOQUE",; 
	"DOCUMENT","http://localhost:8081/",,"1.031217",; 
	"http://localhost:8081/ws/XDADOSPRODUTO.apw")

::Init()
::nSALDOESTOQUERESULT :=  WSAdvValue( oXmlRet,"_SALDOESTOQUERESPONSE:_SALDOESTOQUERESULT:TEXT","float",NIL,NIL,NIL,NIL,NIL,NIL) 

END WSMETHOD

oXmlRet := NIL
Return .T.


// WSDL Data Structure ARRAYOFTABELASB1

WSSTRUCT XDADOSPRODUTO_ARRAYOFTABELASB1
	WSDATA   oWSTABELASB1              AS XDADOSPRODUTO_TABELASB1 OPTIONAL
	WSMETHOD NEW
	WSMETHOD INIT
	WSMETHOD CLONE
	WSMETHOD SOAPRECV
ENDWSSTRUCT

WSMETHOD NEW WSCLIENT XDADOSPRODUTO_ARRAYOFTABELASB1
	::Init()
Return Self

WSMETHOD INIT WSCLIENT XDADOSPRODUTO_ARRAYOFTABELASB1
	::oWSTABELASB1         := {} // Array Of  XDADOSPRODUTO_TABELASB1():New()
Return

WSMETHOD CLONE WSCLIENT XDADOSPRODUTO_ARRAYOFTABELASB1
	Local oClone := XDADOSPRODUTO_ARRAYOFTABELASB1():NEW()
	oClone:oWSTABELASB1 := NIL
	If ::oWSTABELASB1 <> NIL 
		oClone:oWSTABELASB1 := {}
		aEval( ::oWSTABELASB1 , { |x| aadd( oClone:oWSTABELASB1 , x:Clone() ) } )
	Endif 
Return oClone

WSMETHOD SOAPRECV WSSEND oResponse WSCLIENT XDADOSPRODUTO_ARRAYOFTABELASB1
	Local nRElem1, oNodes1, nTElem1
	::Init()
	If oResponse = NIL ; Return ; Endif 
	oNodes1 :=  WSAdvValue( oResponse,"_TABELASB1","TABELASB1",{},NIL,.T.,"O",NIL,NIL) 
	nTElem1 := len(oNodes1)
	For nRElem1 := 1 to nTElem1 
		If !WSIsNilNode( oNodes1[nRElem1] )
			aadd(::oWSTABELASB1 , XDADOSPRODUTO_TABELASB1():New() )
			::oWSTABELASB1[len(::oWSTABELASB1)]:SoapRecv(oNodes1[nRElem1])
		Endif
	Next
Return

// WSDL Data Structure TABELASB1

WSSTRUCT XDADOSPRODUTO_TABELASB1
	WSDATA   cB1_COD                   AS string
	WSDATA   cB1_DESC                  AS string
	WSDATA   cB1_LOCPAD                AS string
	WSDATA   cB1_MSBLQL                AS string
	WSDATA   cB1_TIPO                  AS string
	WSDATA   cB1_UM                    AS string
	WSMETHOD NEW
	WSMETHOD INIT
	WSMETHOD CLONE
	WSMETHOD SOAPRECV
ENDWSSTRUCT

WSMETHOD NEW WSCLIENT XDADOSPRODUTO_TABELASB1
	::Init()
Return Self

WSMETHOD INIT WSCLIENT XDADOSPRODUTO_TABELASB1
Return

WSMETHOD CLONE WSCLIENT XDADOSPRODUTO_TABELASB1
	Local oClone := XDADOSPRODUTO_TABELASB1():NEW()
	oClone:cB1_COD              := ::cB1_COD
	oClone:cB1_DESC             := ::cB1_DESC
	oClone:cB1_LOCPAD           := ::cB1_LOCPAD
	oClone:cB1_MSBLQL           := ::cB1_MSBLQL
	oClone:cB1_TIPO             := ::cB1_TIPO
	oClone:cB1_UM               := ::cB1_UM
Return oClone

WSMETHOD SOAPRECV WSSEND oResponse WSCLIENT XDADOSPRODUTO_TABELASB1
	::Init()
	If oResponse = NIL ; Return ; Endif 
	::cB1_COD            :=  WSAdvValue( oResponse,"_B1_COD","string",NIL,"Property cB1_COD as s:string on SOAP Response not found.",NIL,"S",NIL,NIL) 
	::cB1_DESC           :=  WSAdvValue( oResponse,"_B1_DESC","string",NIL,"Property cB1_DESC as s:string on SOAP Response not found.",NIL,"S",NIL,NIL) 
	::cB1_LOCPAD         :=  WSAdvValue( oResponse,"_B1_LOCPAD","string",NIL,"Property cB1_LOCPAD as s:string on SOAP Response not found.",NIL,"S",NIL,NIL) 
	::cB1_MSBLQL         :=  WSAdvValue( oResponse,"_B1_MSBLQL","string",NIL,"Property cB1_MSBLQL as s:string on SOAP Response not found.",NIL,"S",NIL,NIL) 
	::cB1_TIPO           :=  WSAdvValue( oResponse,"_B1_TIPO","string",NIL,"Property cB1_TIPO as s:string on SOAP Response not found.",NIL,"S",NIL,NIL) 
	::cB1_UM             :=  WSAdvValue( oResponse,"_B1_UM","string",NIL,"Property cB1_UM as s:string on SOAP Response not found.",NIL,"S",NIL,NIL) 
Return


