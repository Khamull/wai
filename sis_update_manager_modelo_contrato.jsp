<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="contrato" class="servico.Contrato" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>


<%
//Recupera valores trazidos do Formul�rio de Altera��o de Contrato
//Atrubui eles ao objeto contrato
contrato.contratoID 	= Integer.parseInt(request.getParameter("contratoID"));
contrato.contratoTexto 	= request.getParameter("contratoTexto");
%>

<%
//Altera as informa��es na base de Dados
st.execute(contrato.alteraContrato());
%>

<%
//Rerireciona para a p�gina de altera��o do contrato
response.sendRedirect("sis_update_modelo_contrato.jsp?msg=2");
%>


<%
 //fecha a consulta
 st.close();
%>