<%//@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp"%>

<jsp:useBean id="caixa" class="financeiro.LivroCaixa" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber o resultado de uma consulta
ResultSet rs = null;
%>

<%
//Recupera os valores Trazidos do Formul�rio e Atribui ao Objeto caixa
caixa.banco = request.getParameter("banco");

	//Trata saldo
	String valorInicial = request.getParameter("valorInicial");
	caixa.valorInicial = Float.parseFloat(valorInicial.replace(",","."));
	
caixa.descricao = request.getParameter("descricao");

	//Trata data
	String dataInicio = data.dataAtual();
	dataInicio = data.converteParaData(dataInicio);
	caixa.dataInicio = dataInicio;
	
caixa.saldo = caixa.valorInicial;
%>

<%
//Verifica se j� existe um Banco Cadastrado no Livro Caixa com esse nome
rs = st.executeQuery(caixa.pesquisaBancoPorNome());
//Se Houver direciona para a p�gina de Cadastrado reportando o Erro
if(rs.next()){
	response.sendRedirect("sis_insert_livro_caixa.jsp?msg=3");
}else{
	//Sen�o: Cadastra o novo Banco
	st.execute(caixa.cadastraBanco());
	//Redireciona para a p�gina de Lista de Banco
	response.sendRedirect("sis_view_livro_caixa.jsp?msg=1");
}

%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Salvar Banco</title>
</head>
<body>

</body>
</html>