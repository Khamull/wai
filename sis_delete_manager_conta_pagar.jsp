<%@ page import="java.sql.*" %>

<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="pagar" class="financeiro.Pagar" scope="page"></jsp:useBean>

<%
//Recupera o ID da Conta � Pagar que ir� ser excluido e adiciona ao Objeto
pagar.pagarID = Integer.parseInt(request.getParameter("pagarID"));

//chama o Metodo que ir� excluir essa conta
st.execute(pagar.excluiPagar());

//direciona para a p�gina que lista as Contas � Pagar
response.sendRedirect("sis_conta_pagar.jsp?msg=4");
%>

<%
 //fecha a consulta
 st.close();
%>