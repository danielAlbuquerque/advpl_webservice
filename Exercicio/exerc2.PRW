/*Exercicio
1.	Crie um WebService buscando os dados da tabela de clientes com a parametrização de quantos registros deseja ser apresentado
*/
#include "Totvs.ch"
#include "TotvsWebSrv.ch"
#Include "TbiConn.ch"


Wsservice EXERC2 Description "Busca o cliente na base "

WsData nQtd			As integer
WsData aClientes    As array of Cliente
WsData cEmp			As String
WsData cFil			As String

WsMethod ApresentaCliente Description "Apresenta a quantidade informada de clientes"

EndWsService


WsStruct Cliente
	WsData	A1_COD	 	 as	String
	WsData	A1_LOJA	 	 as	String
	WsData	A1_NOME	 	 as	String
	WsData	A1_NREDUZ	 as	String
	WsData	A1_END	 	 as	String
	WsData	A1_MUN	 	 as	String
	WsData	A1_CGC	 	 as	String
	WsData	A1_INSCRM	 as	String
	WsData	A1_EMAIL	 as	String
	WsData	A1_PAIS	 	 as	String
	WsData	A1_CODPAIS	 as	String 
	WsData	A1_PESSOA	 as	String
	WsData	A1_TIPO	 	 as	String
	WsData	A1_ESTADO	 as	String
	WsData	A1_EST	 	 as	String
	WsData	A1_BAIRRO	 as	String
	WsData	A1_CEP  	 as	String
EndWsStruct

WsMethod ApresentaCliente WsReceive nQtd, cEmp, cFil  wsSend aClientes Wsservice EXERC2

Local aTab		:= {"SA1"}

RpcSetEnv(cEmp,cFil,,,'FIN','Apresenta Cliente',aTab)//abre a conexão com o banco e a empresa padrão

dbSelectArea("SA1") 
SA1->(dbSetOrder(1))
SA1->(dbGotop())

For nFor := 1 To nQtd

	IF SA1->(!EOF())
		aadd(aClientes,WsClassNew("Cliente"))
		aClientes[nfor]:A1_COD		:= SA1->A1_COD
		aClientes[nfor]:A1_LOJA		:= SA1->A1_LOJA
		aClientes[nfor]:A1_NOME		:= SA1->A1_NOME
		aClientes[nfor]:A1_NREDUZ	:= SA1->A1_NREDUZ
		aClientes[nfor]:A1_END		:= SA1->A1_END
		aClientes[nfor]:A1_MUN		:= SA1->A1_MUN
		aClientes[nfor]:A1_CGC		:= SA1->A1_CGC
		aClientes[nfor]:A1_INSCRM	:= SA1->A1_INSCRM
		aClientes[nfor]:A1_EMAIL	:= SA1->A1_EMAIL
		aClientes[nfor]:A1_PAIS		:= SA1->A1_PAIS
		aClientes[nfor]:A1_CODPAIS	:= SA1->A1_CODPAIS
		aClientes[nfor]:A1_PESSOA	:= SA1->A1_PESSOA
		aClientes[nfor]:A1_TIPO		:= SA1->A1_TIPO
		aClientes[nfor]:A1_ESTADO	:= SA1->A1_ESTADO
		aClientes[nfor]:A1_EST		:= SA1->A1_EST
		aClientes[nfor]:A1_BAIRRO	:= SA1->A1_BAIRRO
		aClientes[nfor]:A1_CEP		:= SA1->A1_CEP
		SA1->(DBSKIP())
	EndIf

Next nFor

Return .t.





