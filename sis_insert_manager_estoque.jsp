<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="estoque" class="cadastro.Estoque" scope="page"></jsp:useBean>

<%
//Instancia um Objeto do Tipo ResultSet para receber o resultado de uma consulta
ResultSet rs = null;
%>

<%
//Recupera valores trazidos do Formulário de Alimentação de Estoque
//Atrubui eles ao objeto estoque
estoque.fornecedor.fornecedorID = Integer.parseInt(request.getParameter("fornID"));
estoque.produto.produtoID 		= Integer.parseInt(request.getParameter("prodID"));

//trata valores
String precoCusto 				= request.getParameter("precoCusto");
String preco					= request.getParameter("precoVenda");
estoque.produto.precoCusto 		= Float.parseFloat(precoCusto.replace(",","."));
estoque.produto.preco 			= Float.parseFloat(preco.replace(",","."));

estoque.produto.lucro 			= request.getParameter("lucro");
estoque.produto.unidade 		= request.getParameter("unidade");
float qtdd						= Float.parseFloat(request.getParameter("quantidade"));
estoque.usuario 				= request.getParameter("usuario");
%>

<%
//Salva os dados na tabela estoque
st.execute(estoque.salvaEstoque());

//Pesquisa quantidade em Estoque
rs = st.executeQuery(estoque.pesquisaEstoque());

//Soma Estoque
int q = 0;
if(rs.next()){
	q = rs.getInt("estoque");
}
estoque.quantidade = (q + qtdd);

//Atualiza os dados na tabela produto
st.execute(estoque.alteraEstoqueProduto());

//Redireciona para a listagem de Produtos;
response.sendRedirect("sis_view_produtos.jsp?msg=6");
%>

<%
 //fecha a query
 st.close();
%>