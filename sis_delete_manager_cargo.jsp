<%@ page import="java.sql.*" %>

<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="cargo" class="cadastro.Cargo" scope="page"></jsp:useBean>

<%
//Recupera o ID do cargo que ir� ser excluido e adiciona ao Objeto
cargo.cargoID = Integer.parseInt(request.getParameter("cargoID"));

//chama o Metodo que ir� excluir esse cargo
st.execute(cargo.excluiCargo());

//direciona para a p�gina que lista os cargos
response.sendRedirect("sis_view_cargos.jsp?msg=3");
%>

<%
 //fecha a consulta
 st.close();
%>