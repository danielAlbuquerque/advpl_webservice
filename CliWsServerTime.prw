#INCLUDE "PROTHEUS.CH"
#INCLUDE "APWEBSRV.CH"

/* ===============================================================================
WSDL Location    http://localhost:8081/ws/XSERVERTIME.apw?WSDL
Gerado em        09/27/16 10:57:28
Observações      Código-Fonte gerado por ADVPL WSDL Client 1.120703
                 Alterações neste arquivo podem causar funcionamento incorreto
                 e serão perdidas caso o código-fonte seja gerado novamente.
=============================================================================== */

User Function _MOLHMQS ; Return  // "dummy" function - Internal Use 

/* -------------------------------------------------------------------------------
WSDL Service WSXSERVERTIME
------------------------------------------------------------------------------- */

WSCLIENT WSXSERVERTIME

	WSMETHOD NEW
	WSMETHOD INIT
	WSMETHOD RESET
	WSMETHOD CLONE
	WSMETHOD MOSTRAHORA

	WSDATA   _URL                      AS String
	WSDATA   _HEADOUT                  AS Array of String
	WSDATA   _COOKIES                  AS Array of String
	WSDATA   cPARAMETRO                AS string
	WSDATA   cMOSTRAHORARESULT         AS string

ENDWSCLIENT

WSMETHOD NEW WSCLIENT WSXSERVERTIME
::Init()
If !FindFunction("XMLCHILDEX")
	UserException("O Código-Fonte Client atual requer os executáveis do Protheus Build [7.00.131227A-20160510 NG] ou superior. Atualize o Protheus ou gere o Código-Fonte novamente utilizando o Build atual.")
EndIf
Return Self

WSMETHOD INIT WSCLIENT WSXSERVERTIME
Return

WSMETHOD RESET WSCLIENT WSXSERVERTIME
	::cPARAMETRO         := NIL 
	::cMOSTRAHORARESULT  := NIL 
	::Init()
Return

WSMETHOD CLONE WSCLIENT WSXSERVERTIME
Local oClone := WSXSERVERTIME():New()
	oClone:_URL          := ::_URL 
	oClone:cPARAMETRO    := ::cPARAMETRO
	oClone:cMOSTRAHORARESULT := ::cMOSTRAHORARESULT
Return oClone

// WSDL Method MOSTRAHORA of Service WSXSERVERTIME

WSMETHOD MOSTRAHORA WSSEND cPARAMETRO WSRECEIVE cMOSTRAHORARESULT WSCLIENT WSXSERVERTIME
Local cSoap := "" , oXmlRet

BEGIN WSMETHOD

cSoap += '<MOSTRAHORA xmlns="http://localhost:8081/">'
cSoap += WSSoapValue("PARAMETRO", ::cPARAMETRO, cPARAMETRO , "string", .T. , .F., 0 , NIL, .F.) 
cSoap += "</MOSTRAHORA>"

oXmlRet := SvcSoapCall(	Self,cSoap,; 
	"http://localhost:8081/MOSTRAHORA",; 
	"DOCUMENT","http://localhost:8081/",,"1.031217",; 
	"http://localhost:8081/ws/XSERVERTIME.apw")

::Init()
::cMOSTRAHORARESULT  :=  WSAdvValue( oXmlRet,"_MOSTRAHORARESPONSE:_MOSTRAHORARESULT:TEXT","string",NIL,NIL,NIL,NIL,NIL,NIL) 

END WSMETHOD

oXmlRet := NIL
Return .T.



