<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>


<jsp:useBean id="parametro" class="cadastro.Parametros" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>


<%
//Recupera valores trazidos do Formul�rio de Altera��o de Parametros
//Atrubui eles ao objeto parametro
parametro.codigoParametro = request.getParameter("codigoParametro");
parametro.valorParametro = Integer.parseInt(request.getParameter("valorParametro"));
%>

<%
//Altera as informa��es na base de Dados
st.execute(parametro.atualizaParametro());
%>

<%
//Rerireciona para a p�gina de altera��o do parametros
response.sendRedirect("sis_update_parametros.jsp?msg=2");
%>


<%
 //fecha a consulta
 st.close();
%>