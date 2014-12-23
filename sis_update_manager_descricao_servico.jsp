<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>


<%
//Recupera valores trazidos do Formul�rio de Servico
//Atrubui eles ao objeto servico
servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));
servico.descricao = request.getParameter("descricao");
%>

<%
//Atualiza a descri��o do Servico no Banco de Dados
st.execute(servico.atualizaServico());
%>

<%
//Atualiza o status do Servico (Visualizado) para (N�o-Visualizado)
st.execute(servico.naoVisualizado());
%>

<%
//Ap�s feita as altera��es redireciona para a p�gina sis_view_servicos.jsp onde lista todos os servicos
response.sendRedirect("sis_view_contratos.jsp?msg=2");
%>

<%
 //fecha a consulta
 st.close();
%>