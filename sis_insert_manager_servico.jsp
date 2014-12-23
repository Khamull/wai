<%//@ page errorPage="index.jsp?msg=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/seguranca.jsp" %>

<jsp:useBean id="item" class="pdv.VendaItem" scope="page"></jsp:useBean>

<jsp:useBean id="estoque" class="cadastro.Estoque" scope="page"></jsp:useBean>

<jsp:useBean id="produtoEstoque" class="cadastro.ProdutoEstoque" scope="page"></jsp:useBean>

<jsp:useBean id="servicos" class="servico.Servicos" scope="page"></jsp:useBean>


<%
//Recupera valores do formulário para salvar como servico
servicos.servicoTitulo 	= request.getParameter("servicoTitulo");
servicos.tipo			= request.getParameter("tipo");
servicos.valorM			= Float.parseFloat(request.getParameter("valorM"));
servicos.valorP			= Integer.parseInt(request.getParameter("valorP"));
%>


<%
//Executa a Query q irá salvar o item no banco de dados
st.execute(servicos.cadastraServico());
%>



<%
//Direciona para o PDV novamente
response.sendRedirect("sis_view_servicos.jsp?msg=1");
%>

<%
//fecha Statment
st.close();
%>