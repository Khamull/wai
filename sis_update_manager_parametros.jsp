<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>


<jsp:useBean id="parametro" class="cadastro.Parametros" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>


<%
//Recupera valores trazidos do Formulário de Alteração de Parametros
//Atrubui eles ao objeto parametro
parametro.codigoParametro = request.getParameter("codigoParametro");
parametro.valorParametro = Integer.parseInt(request.getParameter("valorParametro"));
%>

<%
//Altera as informações na base de Dados
st.execute(parametro.atualizaParametro());
%>

<%
//Rerireciona para a página de alteração do parametros
response.sendRedirect("sis_update_parametros.jsp?msg=2");
%>


<%
 //fecha a consulta
 st.close();
%>