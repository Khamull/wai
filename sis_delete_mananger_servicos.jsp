<%@ page import="java.sql.*" %>

<%@ include file="inc/conexao.jsp" %>


<jsp:useBean id="servicos" class="servico.Servicos" scope="page"></jsp:useBean>

<%
//Recupera o ID do servico que ir� ser excluido e adiciona ao Objeto
servicos.servicoID = Integer.parseInt(request.getParameter("servicoID"));

//chama o Metodo que ir� excluir esse servi�o
st.execute(servicos.excluiServico());

//direciona para a p�gina que lista os servi�os
response.sendRedirect("sis_view_servicos.jsp?msg=3");
%>

<%
 //fecha a consulta
 st.close();
%>