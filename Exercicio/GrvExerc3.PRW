#include "Totvs.ch"
#include "TotvsWebSrv.ch"

User function GrvExerc3()
Local oObj 		:= Nil
Local cCodCli 	:= ""
Local cLoja		:= '01'
Local aDadosGrv	:= {}
Local aDadoGrv	:= {}

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³busco a criação do objeto pelo cliente criado³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

oOBj   		:= WSEXERC2():new()
oObj:APRESENTACLIENTE(10,"99","01")
aDadosGrv	:= oObj:oWsApresentaClienteResult:OwsCliente

For nFor := 1 To Len(aDadosGrv)
	
	aDadoGrv := aDadosGrv[nFor]
	
	Reclock("SA1",.T.)
	SA1->A1_COD		:= GETSXENUM("SA1","A1_COD")
	SA1->A1_LOJA	:= '01'
	SA1->A1_BAIRRO	:= 	aDadoGrv:CA1_BAIRRO
	SA1->A1_CEP		:= 	aDadoGrv:CA1_CEP
	SA1->A1_CGC		:= 	aDadoGrv:CA1_CGC
	SA1->A1_CODPAIS	:= 	aDadoGrv:CA1_CODPAIS
	SA1->A1_EMAIL	:= 	aDadoGrv:CA1_EMAIL
	SA1->A1_END		:= 	aDadoGrv:CA1_END
	SA1->A1_EST		:= 	aDadoGrv:CA1_EST
	SA1->A1_ESTADO	:= 	aDadoGrv:CA1_ESTADO
	SA1->A1_INSCRM	:= 	aDadoGrv:CA1_INSCRM
	SA1->A1_MUN		:= 	aDadoGrv:CA1_MUN
	SA1->A1_NOME	:= 	aDadoGrv:CA1_NOME
	SA1->A1_NREDUZ	:= 	aDadoGrv:CA1_NREDUZ
	SA1->A1_PAIS	:= 	aDadoGrv:CA1_PAIS
	SA1->A1_PESSOA	:= 	aDadoGrv:CA1_PESSOA
	SA1->A1_TIPO	:= 	aDadoGrv:CA1_TIPO
	MSUNLOCK()
	ConfirmSXE()
Next nFor

Return()