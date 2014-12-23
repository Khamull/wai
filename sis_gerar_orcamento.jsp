<%//@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="orcamento" class="pdv.Orcamento" scope="page"></jsp:useBean>
 
<jsp:useBean id="caixa" class="caixaloja.Caixa" scope="page"></jsp:useBean>
 
 
<%
//Instancia um Objeto do tipo Statement para ajudar na query
Statement st02 = con.createStatement();
%>
 
<%
//Instancia Objeto do tipo ResultSet para ser alimentado com o resultado da Consulta
ResultSet rs = null;
ResultSet rs01 = null;
ResultSet rs02 = null;
%> 
 
 
<%
//ANTES DE CRIAR UM NOVO ORCAMENTO OU ABRIR UM J� EXISTENTE
//VERIFICA SE FOI FEITA A ABERTURA DO CAIXA COM O LOGIN DO
//USUARIO QUE EST� LOGADO NO MOMENTO

//Atribui o nome do usuario ao objeto caixa para realizar
//a consulta posteriormente
//caixa.usuario.login = (String)session.getAttribute("usuario");

//Faz a consulta na Base de Dados
//rs02 = st02.executeQuery(caixa.verificaCaixa());


//Caso n�o haja um caixa aberto com esse usu�rio que est� logado
//ser� redirecionado para a p�gina de menu dando a mensagem ao usu�rio.
//if(rs02.next()){
	//Continua executando a p�gina
%>
 
 
<%
//Atribui o login do usuario logado ao objeto usuario
orcamento.usuario.login = (String)session.getAttribute("usuario");

//verifica se j� tem um Orcamento Aberto com esse usuario do Sistema
rs = st.executeQuery(orcamento.orcamentoAberta());

//Caso tenha um Aberto direciona para a p�gina de orcamento sem abrir um novo
if(rs.next()){
	response.sendRedirect("sis_insert_orcamento.jsp?orcamentoID="+rs.getString("orcamentoID"));
}else{
	//Sen�o abre um novo ORCAMENTO na tabela orcamento e direciona para a p�gina de orcamento
	st.execute(orcamento.cadastraOrcamento());
	rs01 = st.executeQuery(orcamento.orcamentoAberta());
	if(rs01.next()){
		response.sendRedirect("sis_insert_orcamento.jsp?orcamentoID="+rs01.getString("orcamentoID"));	
	}
}

%>

<%
//}else{
//	response.sendRedirect("sis_menu.jsp?msg=1");
//}
%>