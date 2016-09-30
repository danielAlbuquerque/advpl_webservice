#INCLUDE "PROTHEUS.CH"
#INCLUDE "APWEBSRV.CH"

/* ===============================================================================
WSDL Location    http://localhost:8081/ws/XCURRENTDATE.apw?WSDL
Gerado em        09/27/16 11:24:59
Observações      Código-Fonte gerado por ADVPL WSDL Client 1.120703
                 Alterações neste arquivo podem causar funcionamento incorreto
                 e serão perdidas caso o código-fonte seja gerado novamente.
=============================================================================== */

User Function _KRWBLMR ; Return  // "dummy" function - Internal Use 

/* -------------------------------------------------------------------------------
WSDL Service WSXCURRENTDATE
------------------------------------------------------------------------------- */

WSCLIENT WSXCURRENTDATE

	WSMETHOD NEW
	WSMETHOD INIT
	WSMETHOD RESET
	WSMETHOD CLONE
	WSMETHOD MOSTRADATA

	WSDATA   _URL                      AS String
	WSDATA   _HEADOUT                  AS Array of String
	WSDATA   _COOKIES                  AS Array of String
	WSDATA   cPARAMETRO                AS string
	WSDATA   cMOSTRADATARESULT         AS string

ENDWSCLIENT

WSMETHOD NEW WSCLIENT WSXCURRENTDATE
::Init()
If !FindFunction("XMLCHILDEX")
	UserException("O Código-Fonte Client atual requer os executáveis do Protheus Build [7.00.131227A-20160510 NG] ou superior. Atualize o Protheus ou gere o Código-Fonte novamente utilizando o Build atual.")
EndIf
Return Self

WSMETHOD INIT WSCLIENT WSXCURRENTDATE
Return

WSMETHOD RESET WSCLIENT WSXCURRENTDATE
	::cPARAMETRO         := NIL 
	::cMOSTRADATARESULT  := NIL 
	::Init()
Return

WSMETHOD CLONE WSCLIENT WSXCURRENTDATE
Local oClone := WSXCURRENTDATE():New()
	oClone:_URL          := ::_URL 
	oClone:cPARAMETRO    := ::cPARAMETRO
	oClone:cMOSTRADATARESULT := ::cMOSTRADATARESULT
Return oClone

// WSDL Method MOSTRADATA of Service WSXCURRENTDATE

WSMETHOD MOSTRADATA WSSEND cPARAMETRO WSRECEIVE cMOSTRADATARESULT WSCLIENT WSXCURRENTDATE
Local cSoap := "" , oXmlRet

BEGIN WSMETHOD

cSoap += '<MOSTRADATA xmlns="http://localhost:8081/">'
cSoap += WSSoapValue("PARAMETRO", ::cPARAMETRO, cPARAMETRO , "string", .T. , .F., 0 , NIL, .F.) 
cSoap += "</MOSTRADATA>"

oXmlRet := SvcSoapCall(	Self,cSoap,; 
	"http://localhost:8081/MOSTRADATA",; 
	"DOCUMENT","http://localhost:8081/",,"1.031217",; 
	"http://localhost:8081/ws/XCURRENTDATE.apw")

::Init()
::cMOSTRADATARESULT  :=  WSAdvValue( oXmlRet,"_MOSTRADATARESPONSE:_MOSTRADATARESULT:TEXT","string",NIL,NIL,NIL,NIL,NIL,NIL) 

END WSMETHOD

oXmlRet := NIL
Return .T.



