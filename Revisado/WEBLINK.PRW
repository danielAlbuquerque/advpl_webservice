#INCLUDE "APWEBSRV.CH" 
#INCLUDE "PROTHEUS.CH" 
#DEFINE STR0001 "Servico de Constulta ao Codigo de Enderacamento Postal" 
#DEFINE STR0002 "Método para pesquisa do CEP" 

WSSERVICE u_wsCEPInfo DESCRIPTION STR0001 NAMESPACE "http://localhost:90/ws/u_wscepinfo.apw" //"Servico de Constulta ao Codigo de Enderacamento Postal" 

 WSDATA CEP As String 
 WSDATA XML As String 
 
 WSMETHOD CEPSearch DESCRIPTION STR0002 //"Método para pesquisa do CEP" ENDWSSERVICE
 
ENDWSSERVICE

WSMETHOD CEPSearch WSRECEIVE CEP WSSEND XML WSSERVICE u_wsCEPInfo 

 Local cUrl := "" 
 Local lWsReturn := .T. 
 
 DEFAULT CEP := Self:CEP
 
  cUrl   := "http://cep.republicavirtual.com.br/web_cep.php?cep="+StrTran(CEP,"-","")+"&formato=xml"
  
  //http://republicavirtual.com.br/web_cep.php?cep=08410420&formato=query_string"
  //http://cotacao.republicavirtual.com.br/web_cotacao.php
  
  
  Self:XML  := HttpGet( cUrl )
  
  XML    := Self:XML

 Return( lWsReturn )


