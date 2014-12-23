<%//@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<%
//Essa página tem como objetivo transformar um Orçamento que foi feito em um Contrato fechado
//Mudando apenas alguns status na tabela servico
%>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="data1" class="formatar.Datas" scope="page"></jsp:useBean>

<%
//Instancia um Objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
%>
 
<%
//Instancia Objeto do tipo ResultSet para ser alimentado com o resultado da Consulta
ResultSet rs = null;
ResultSet rs01 = null;
%>


<%
//Recupera o ID do servico trazido via URL
servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));
%>


<%
//Pesquisa o ultimo contrato gerado para gerar o proximo
rs = st.executeQuery(servico.ultimoContratoAno(data.anoAtual()));

int ultimoContrato = 0;

if(rs.next()){
	ultimoContrato = rs.getInt("ultimoContrato");
}

	ultimoContrato += 1;
	
	servico.contrato = ultimoContrato;
	
	
//Altera a data de Contrato
servico.dataContrato = data1.converteParaData(data1.dataAtual());
%>


<%
//Altera as informações na tabela servico convertendo de (ORÇAMENTO) para (CONTRATO)
st.execute(servico.aprovadoPorCliente());
%>

<%
//Direciona para a impressão do Recibo
response.sendRedirect("sis_print_adiantamento_servico.jsp?servicoID="+servico.servicoID);
%>

<%
//Direciona para a página onde lista os Contratos
//response.sendRedirect("sis_view_contratos.jsp?msg=5");
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gerar Contrato</title>
</head>
<body>

</body>
</html>