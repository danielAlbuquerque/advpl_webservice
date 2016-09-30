#INCLUDE "TOTVS.CH"


User Function ConsumoExer2()

Local oBj     := Nil
Local aResult := {}
Local nX

	oBj:= WSEXERC2():New()  

	oBj:APRESENTACLIENTE(5,"99","01")
	                                 
	aResult := oBj:oWSAPRESENTACLIENTERESULT:OWSCLIENTE  
	
	For nX := 1 To Len(aResult)
    	Alert( aResult[nX]:CA1_COD    + " " +  aResult[nX]:CA1_LOJA +" "+ aResult[nX]:CA1_NOME + " " + ;
               aResult[nX]:CA1_NREDUZ + " " +  aResult[nX]:CA1_PESSOA 
	Next nX


Return( NIL )
