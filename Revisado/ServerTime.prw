//#include "Protheus.ch"
//#include "ApWebSrv.ch"
#include "Totvs.ch"
#include "Totvswebsrv.ch"
#include "TbiConn.ch"

WSSERVICE SERVERTTIME Description "VEJA O HORARIO"
WSDATA Horario 	AS 	String
WSDATA cParam AS STRING

//String	Dado AdvPL do tipo string.
//Date	Dado AdvPL do tipo data.
//Integer	Dado AdvPL do tipo numérico (apenas números inteiros).
//Float	Dado AdvPL do tipo numérico (pode conter números inteiros e não-inteiros).
//Boolean	Dado AdvPL do tipo booleano (lógico).
//Base64Binary	Dado AdvPL do tipo string binária, aceitando todos os caracteres da tabela ASCII, de CHR(0) à CHR(255).

WSMETHOD GetServerTTime Description "METHOD DE VISUALIZAÇÃO DO HORARIO"

ENDWSSERVICE
                                                                     

WSMETHOD GetServerTTime WSRECEIVE cParam WSSEND Horario WSSERVICE SERVERTTIME

  Local nDay := dow( date() )
   
  if nDay == 1 .Or. nDay == 7
    SetSoapFault( "Metodo não disponível", "Este serviço não funciona no fim de semana." )
     
    return .F.
  Endif

::Horario := TIME()

Return .T.
