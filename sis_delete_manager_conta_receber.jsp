<%@ page import="java.sql.*" %>

<%@ include file="inc/conexao.jsp" %>


<jsp:useBean id="receber" class="financeiro.Receber" scope="page"></jsp:useBean>

<%
//Recupera o ID da Conta � Receber que ir� ser excluido e adiciona ao Objeto
receber.receberID = Integer.parseInt(request.getParameter("receberID"));

//chama o Metodo que ir� excluir essa conta
st.execute(receber.excluiContaReceber());

//direciona para a p�gina que lista as Contas � Receber
response.sendRedirect("sis_conta_receber.jsp?msg=3");
%>

<%
 //fecha a consulta
 st.close();
%>