<%@ page import="java.sql.*" %>

<%@ include file="inc/conexao.jsp" %>


<jsp:useBean id="cliente" class="cadastro.Cliente" scope="page"></jsp:useBean>

<%
//Recupera o ID do cliente que ir� ser excluido e adiciona ao Objeto
cliente.clienteID = Integer.parseInt(request.getParameter("clienteID"));

//chama o Metodo que ir� excluir esse cliente
st.execute(cliente.excluirCliente());

//direciona para a p�gina que lista os clientes
response.sendRedirect("sis_view_clientes.jsp?msg=3");
%>

<%
 //fecha a consulta
 st.close();
%>