<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="cargo" class="cadastro.Cargo" scope="page"></jsp:useBean>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>

<%
//Atribui o ID do Servi�o ao objeto servico
servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));

//Altera o valor de N�o visualizado para Visualizado
st.execute(servico.visualizado());
%>

<%
//Ap�s alterado direciona para a p�gina de visualiza��o de Servi�os
response.sendRedirect("sis_view_servicos.jsp?msg=4");
%>

<%
 //fecha a consulta
 st.close();
%>