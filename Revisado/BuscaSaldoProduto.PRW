#INCLUDE "TOTVS.CH"
#INCLUDE "APWEBSRV.CH"

WsService BuscaSaldo Description "Busca Saldo Produto"

    WsData Produto as String
	WsData Saldo   as Float

	WSMETHOD SALDOPRODUTO Description "Saldo do Produto"
	
EndWsService

WSMETHOD SALDOPRODUTO WSRECEIVE Produto WSSEND Saldo WSSERVICE BuscaSaldo

   SB2->( dbSetOrder(1) )
   
   If SB2->( dbSeek( xFilial("SB2") + Produto ) )  
   	::Saldo := ( SB2->B2_QATU - SB2->B2_RESERVA - SB2->B2_QEMP )
   Else	    
   	::Saldo := 0
   EndIf	
   		
Return( .T. )   
	




