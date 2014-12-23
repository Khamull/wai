<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="cargo" class="cadastro.Cargo" scope="page"></jsp:useBean>
<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>


<%
//Recupera valores trazidos da lista de Servicos
//Atrubui eles ao objeto servico
String visualizar = request.getParameter("visualizar");
servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));
%>

<%
//Verifica se é para ativar ou desativar a visualização do cliente
if(visualizar.equals("S")){
	st.execute(servico.visualizar());
}else{
	st.execute(servico.naoVisualizar());
}


//Direciona para a listagem dos serviços
response.sendRedirect("sis_view_contratos.jsp?msg=6");

%>


<%
 //fecha a consulta
 st.close();
%>