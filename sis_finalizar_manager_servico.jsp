<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="venda" class="pdv.Venda" scope="page"></jsp:useBean>

<jsp:useBean id="servico" class="servico.Servico"></jsp:useBean>

<jsp:useBean id="receber" class="financeiro.Receber" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="lancamentos" class="financeiro.Lancamentos" scope="page"></jsp:useBean>

<jsp:useBean id="caixa" class="financeiro.LivroCaixa" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statment para realizar uma query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
%>

<%
//Instancia um objeto do tipo Resultset para receber o resultado de uma consulta
ResultSet rs01 = null;
ResultSet rs02 = null;
%>

<%
//Recupera todos os dados do Formul�rio

//Adiciona ao objeto venda
//venda.vendaID 			= Integer.parseInt(request.getParameter("vendaID"));
//venda.formPag.formPagID = Integer.parseInt(request.getParameter("formID"));
//venda.cliente.clienteID = Integer.parseInt(request.getParameter("clienteID"));
//venda.valor				= Float.parseFloat(request.getParameter("valorVariavel"));
//if(request.getParameter("pago") != ""){
//	String ent = request.getParameter("pago");
//	venda.entrada = Float.parseFloat(ent.replace(",","."));
//}else{
//	venda.entrada = 0;
//}
//if(request.getParameter("troco") != ""){
//	String tro = request.getParameter("troco");
//	venda.troco	= Float.parseFloat(tro.replace(",","."));
//}else{
//	venda.troco = 0;
//}
//venda.vezes 			= Integer.parseInt(request.getParameter("parcelas"));
//if(request.getParameter("desconto") != ""){
//	String desc = request.getParameter("desconto");
//	venda.desconto = Float.parseFloat(desc.replace(",","."));
//}else{
//	venda.desconto = 0;
//}


//Adiciona ao objeto servico
servico.servicoID 					= Integer.parseInt(request.getParameter("servicoID"));
servico.formaPagamento.formPagID 	= Integer.parseInt(request.getParameter("formID"));
servico.cliente.clienteID 			= Integer.parseInt(request.getParameter("clienteID"));
servico.valor						= Float.parseFloat(request.getParameter("valorVariavel"));
servico.valor  						+= Float.parseFloat(request.getParameter("complementoValor"));
if(request.getParameter("pago") != ""){
	String ent = request.getParameter("pago");
	servico.entrada = Float.parseFloat(ent.replace(",","."));
}else{
	servico.entrada = 0;
}
if(request.getParameter("troco") != ""){
	String tro = request.getParameter("troco");
	servico.troco	= Float.parseFloat(tro.replace(",","."));
}else{
	servico.troco = 0;
}
servico.vezes 			= Integer.parseInt(request.getParameter("parcelas"));
if(request.getParameter("desconto") != ""){
	String desc = request.getParameter("desconto");
	servico.desconto = Float.parseFloat(desc.replace(",","."));
}else{
	servico.desconto = 0;
}


//Adiciona ao objeto receber
receber.servico.servicoID	= Integer.parseInt(request.getParameter("servicoID"));
receber.forma.formPagID 	= Integer.parseInt(request.getParameter("formID"));
receber.cliente.clienteID 	= Integer.parseInt(request.getParameter("clienteID"));
receber.de					= Integer.parseInt(request.getParameter("parcelas"));
receber.empresa.empresaID	= Integer.parseInt((String)session.getAttribute("empresaID"));


	//Verifica se a forma de pagamento � diferente de [ (1) Dinheiro ]
	if(receber.forma.formPagID != 1){
	 	float x = Float.parseFloat(request.getParameter("complementoValor"));
		float a = (servico.entrada - servico.troco);
		float b = 0;
		if(request.getParameter("assinatura").equals("S")){
			b = (servico.valor - a);
		}else{
			b = (servico.valor - a - x);
		}
		
		float c = (b / servico.vezes);
		receber.valor = c;
	}else{
		receber.valor = servico.entrada - servico.troco;
	}
%>


<%
//Verifica se foi dado um valor de Entrada e gera um receber com status 'P' (Pago) e Insere no Livro Caixa 'Loja'
if(servico.entrada != 0){
	String d = data.dataAtual();
	receber.vencimento = data.converteParaData(d);
	float entrada = (servico.entrada - servico.troco);
	st.execute(receber.cadastraEntradaServico(entrada));
	
	//Recupera o ID do ultimo receber lan�ado
	rs01 = st01.executeQuery(receber.ultimoReceberIDServico());
	
	//Atribui os valores ao Objeto do tipo Lancamentos
	if(rs01.next()){
		lancamentos.receber.receberID = rs01.getInt("receberID");
	}
	lancamentos.valor = (servico.entrada - servico.troco);
	lancamentos.venda.vendaID = servico.servicoID;
	lancamentos.formaPag.formPagID = servico.formaPagamento.formPagID;
	lancamentos.usuario.login = (String)session.getAttribute("usuario");
	lancamentos.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
	
	
	//Gera um Lan�amento
	st.execute(lancamentos.insereEntradaServico());
	
	//Verifica qual o Atual saldo do caixa Loja
	caixa.livroID = 1;
	rs02 = st02.executeQuery(caixa.saldoEmCaixa());
	
	//Atribui o Valor ao livro caixa loja
	float saldoAtual = 0;
	if(rs02.next()){
		saldoAtual = rs02.getFloat("saldo");
	}
	float adicional = lancamentos.valor;
	float saldoFinal = (saldoAtual + adicional);
	
	//Atualiza o Livro Caixa
	caixa.saldo = saldoFinal;
	st.execute(caixa.atualizaSaldo());
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Calendar"%>
<%@page import="com.sun.xml.internal.bind.v2.runtime.unmarshaller.IntArrayData"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Finaliza Servico</title>
</head>
<body>
<br>
<%=servico.vezes %> vezes de R$ <%=receber.valor %> <br><br>
pago = R$ <%=servico.entrada %><br><br>
troco = R$ <%=servico.troco %><br><br>
desconto = R$ <%=servico.desconto %><br><br>
total = R$ <%=servico.valor %><br><br>

<br><br>

<%
//Verifica se a forma de pagamento � Diferente de Dinheiro
if(servico.formaPagamento.formPagID != 1){
%>

##### VENCIMENTOS #####<br><br>

 <%
 //Trata a data de Vencimento
 Calendar hoje = Calendar.getInstance();
 %>
 <%
 
 int dia = 0;
 int mes = 0;
 int ano = 0;
 
 //Se a forma de pagamento for Cart�o de D�bito acrescenta acrescenta um dia pois s� cair� amanh� e n�o acrescenta um mes
 if(servico.formaPagamento.formPagID == 3){
	 dia = Integer.parseInt(data.diaAtual()) + 1;
	 //Trata dia para n�o ficar maior que 30
	 mes = hoje.get(Calendar.MONTH);
	 if(dia >= 30 || mes == 2){
		 dia = 1;
		 mes = mes + 1;
	 }
 }else if(servico.formaPagamento.formPagID == 4){
	 //Caso a forma de pagemento sej� Cheque n�o precisa acrescentar um mes
	 dia = Integer.parseInt(data.diaAtual());
	 mes = hoje.get(Calendar.MONTH);
 }else{
	 //Sen�o corre as parcelas normais para a partir de hoje 30 / 60 / 90 / 120 / ... dias
	 dia = Integer.parseInt(data.diaAtual());
	 mes = hoje.get(Calendar.MONTH)+ 1;//Peguei o mes atual e somei mais um pois (Estranhamente) o Calendar est� trazendo o m�s anterior
	 
	 //Trata a Data se ela existe daqui 30 dias
	 String dataOk = data.verificaSeExiste(dia, mes);
	 
	 //Da um Split e recupera o dia e o Mes novamente,
	 //Por�m agora j� foi verificado se ele existe
	 String[] vetor = new String[2];
	 vetor = dataOk.split("-");
	 dia = Integer.parseInt(vetor[0]);
	 mes = Integer.parseInt(vetor[1]);
	 
 }
 
 ano = Integer.parseInt(data.anoAtual());
 
 %>
 
<%for(int i = 1; i <= servico.vezes; i++){%>

 <%
 //Acrescenta um mes
 String m = String.valueOf(i+mes);
 String d = String.valueOf(dia);
 
 String dataOk2 = data.verificaSeExiste(Integer.parseInt(d), Integer.parseInt(m));
 
 String[] vetor2 = new String[2];
 
 vetor2 = dataOk2.split("-");
 
 d = vetor2[0];
 m = vetor2[1];
 
	//verifica se n�o veio com duas casas e converte para duas casas
	if(m.length() < 2){
		m = "0"+m;
	}
	
	//verifica se n�o veio com duas casas e converte para duas casas
	if(d.length() < 2){
		d = "0"+d;
	}
 
 %>

 <% 
 //Junta as tres informa��es em uma String
 String dataAtual = d+"/"+m+"/"+ano;
 
 dataAtual = data.trataData(dataAtual);
 
 //dataAtual = data.converteDeData(dataAtual);
 %>
 
 <%=receber.valor %> <%=dataAtual%> <br>
 
 <%
 //Atribui o numero da parcela e o dia de vencimento ao objeto > receber <
 receber.parcela = i;
 receber.vencimento = dataAtual;
 %>
 
 <%
 //A cada vez que passar pelo looping ir� inserir a conta a receber na base de dados
 st.execute(receber.salvarReceberServico());
 %>
 
 
<%} %>
<br>#########################

<%
//Caso a forma de Pagamento seja Dinheiro a Vista ir� inserir uma unica vez no contas a receber
}else{ %>

<%=servico.valor %> - <%=data.dataAtual() %>

<%} %>

<%
//Muda os Status do Servico para F (FINALIZADA) e Altera os valores dele como por ex: Forma de Pagamento

// [ALTERADO 29-03-2013] Alterado para que ao pagar n�o seja finalizado o contrato no momento da assinatura.
if(request.getParameter("assinatura").equals("S")){
	st.execute(servico.completaInformacoesServico());
}else{
	st.execute(servico.completaServico());
}
%>

<%
//Envia para a tela de impress�o de pedido

//Verifica se veio da assinatura do contrato ou do fechamento
if(request.getParameter("assinatura").equals("S")){
	response.sendRedirect("sis_print_servico_fechado.jsp?servicoID="+servico.servicoID+"&assinatura=S");//Caso der algum problema � s� comentar essa linha que ir� aparecer na tela todas as informa��es do Pagamento da Compra
}else{
	response.sendRedirect("sis_print_servico_fechado_final.jsp?servicoID="+servico.servicoID);//Caso der algum problema � s� comentar essa linha que ir� aparecer na tela todas as informa��es do Pagamento da Compra
}
%>


</body>
</html>