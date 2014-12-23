<%//@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="venda" class="pdv.Venda" scope="page"></jsp:useBean>
 
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
//ANTES DE CRIAR UMA NOVA VENDA OU ABRIR UMA J� EXISTENTE
//VERIFICA SE FOI FEITA A ABERTURA DO CAIXA COM O LOGIN DO
//USUARIO QUE EST� LOGADO NO MOMENTO

//Atribui o nome do usuario ao objeto caixa para realizar
//a consulta posteriormente
caixa.usuario.login = (String)session.getAttribute("usuario");

//Faz a consulta na Base de Dados
rs02 = st02.executeQuery(caixa.verificaCaixa());


//Caso n�o haja um caixa aberto com esse usu�rio que est� logado
//ser� redirecionado para a p�gina de menu dando a mensagem ao usu�rio.
if(rs02.next()){
	//Continua executando a p�gina
%>
 
 
<%
//Atribui o login do usuario logado ao objeto usuario
venda.usuario.login = (String)session.getAttribute("usuario");

//verifica se j� tem uma venda Aberta com esse usuario do Sistema
rs = st.executeQuery(venda.vendaAberta());

//Caso tenha uma Aberta direciona para a p�gina de venda sem abrir uma nova
if(rs.next()){
	response.sendRedirect("sis_pdv.jsp?vendaID="+rs.getString("vendaID"));
}else{
	//Sen�o abre uma nova VENDA na tabela venda e direciona para a p�gina de venda
	st.execute(venda.cadastraVenda());
	rs01 = st.executeQuery(venda.vendaAberta());
	if(rs01.next()){
		response.sendRedirect("sis_pdv.jsp?vendaID="+rs01.getString("vendaID"));	
	}
}

%>

<%
}else{
	response.sendRedirect("sis_menu.jsp?msg=1");
}
%>