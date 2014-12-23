<%//@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="item" class="pdv.VendaItem" scope="page"></jsp:useBean>
 
<jsp:useBean id="estoque" class="cadastro.Estoque" scope="page"></jsp:useBean>

<%
//Instancia um Objeto do tipo Statment
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
%>

<%
//Instancia um Objeto do tipo ResultSet para receber o resultado de uma consulta
ResultSet rs = null;
ResultSet rs01 = null;
%>
 
<%
//Verifica se foi passado parametro via URL
if(request.getParameter("itemID")!= null){
	//Atribui o valor do Parametro ao ID do objeto Item
	item.itemID = Integer.parseInt(request.getParameter("itemID"));
	//Pesquisa Dados relacionados a Esse Item adicionado a Venda
	rs = st.executeQuery(item.pesquisItem());
	
	//Atribui o ID do produto ao Objeto estoque para realizar as proximas pesquisas de Estoque
	//Pesquisa a quantidade desse item que foi retirada do Estoque
	float qtddRetirada = 0;
	if(rs.next()){
		qtddRetirada = rs.getFloat("quantidade");
		estoque.produto.produtoID = rs.getInt("produtoID");
	}
	//Pesquisa quanto tem em Estoque
	rs01 = st01.executeQuery(estoque.pesquisaEstoque());
	float qtddEstoque = 0;
	if(rs01.next()){
		qtddEstoque = rs01.getFloat("estoque");
	}
	//Soma os Valores
	float estoqueAtual = (qtddEstoque + qtddRetirada);
	//Devolve a quantidade ao Estoque
	estoque.produto.estoque = estoqueAtual;
	st02.execute(estoque.alteraEstoque());
	//Exclui o Item da Venda cujo o ID seja igual ao do que foi passado
	st.execute(item.excluiItem());
	//Redireciona para outra página
	response.sendRedirect("sis_gerar_venda.jsp");
}

%>
