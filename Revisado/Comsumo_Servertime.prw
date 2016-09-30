#INCLUDE "TOTVS.CH"

//http://localhost:90/ws/XSERVERTIME.apw?WSDL
User Function ConSerTime()
                   
Local oObj

If oObj := WSXSERVERTIME():NEW() 
	oObj:GETSERVERTIME(' ')
	msgAlert( oObj:cGETSERVERTIMERESULT )
Else  
	
	cSvcError   := GetWSCError()  // Resumo do erro
  cSoapFCode  := GetWSCError(2) // Soap Fault Code
  cSoapFDescr := GetWSCError(3) // Soap Fault Description
  
	If ! empty(cSoapFCode)
    // Caso a ocorrência de erro esteja com o fault_code preenchido ,
    // a mesma teve relação com a chamada do serviço .
    MsgStop(cSoapFDescr,cSoapFCode)
  Else
    // Caso a ocorrência não tenha o soap_code preenchido
    // Ela está relacionada a uma outra falha ,
    // provavelmente local ou interna.
    MsgStop(cSvcError,'FALHA INTERNA DE EXECUCAO DO SERVIÇO')
  Endif
Endif
	


Return( NIL )

//
If oObj:GetServerTime(" ")       //Nome do Metodo
	msgAlert( oObj:cGETSERVERTIMERESULT )
Else
	alert("Erro de Execução : " + GetWSCError() )
EndIf

