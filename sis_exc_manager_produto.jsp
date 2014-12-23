<%@ page errorPage="index.jsp?msg=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/seguranca.jsp" %>

<jsp:useBean id="servicoproduto" class="servico.ServicoProduto" scope="page"></jsp:useBean>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="produto" class="cadastro.Produto" scope="page"></jsp:useBean>

<jsp:useBean id="produtoestoque" class="cadastro.ProdutoEstoque" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
Statement st04 = con.createStatement();
%>

<%
//Instancia um objeto do tipo Resulset para receber o valor de uma consulta
ResultSet rs01 = null;
ResultSet rs02 = null;
ResultSet rs03 = null;
ResultSet rs04 = null;
%>

<%
//Variavel que verifica se � um or�amento ou n�o
String orcamento = "";
%>

<%
//Recupera valores do formul�rio e atribui ao objeto servicoitem
servicoproduto.servicoProdutoID	= Integer.parseInt(request.getParameter("servicoprodutoID"));
servicoproduto.servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));
servico.servicoID = servicoproduto.servico.servicoID;
orcamento = request.getParameter("orc");
%>


<%
//Pesquisa o valor desse servi�o
rs01 = st01.executeQuery(servicoproduto.pequisaProduto());

float valorServico = 0;

if(rs01.next()){
	valorServico = rs01.getFloat("valor");
	produto.produtoID = rs01.getInt("produtoID");
	produtoestoque.produto.produtoID = produto.produtoID;
	produtoestoque.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
	
	
		//Pesquisa o estoque TOTAL atual desse produto
		rs03 = st03.executeQuery(produto.listaProdutosPorID());
	
		float estoqueTotalAtual = 0;
	
		if(rs03.next()){
			estoqueTotalAtual = rs03.getFloat("estoque");
		}
	
			//Atualiza o estoque total
			produto.estoque = (estoqueTotalAtual + 1);
			st.execute(produto.alteraEstoqueProduto());
		
	
		//pesquisa o estoque POR LOJA desse produto
		rs04 = st04.executeQuery(produtoestoque.pesquisaEstoque());
	
		float estoqueAtual = 0;
	
		if(rs04.next()){
			estoqueAtual = rs04.getFloat("quantidade");
		}
	
			//Atualiza o estoque por loja
			produtoestoque.quantidade = (estoqueAtual + 1);
			st.execute(produtoestoque.alteraEstoque());
	
	
}

%>


<%
//Exclui o Servi�o
st.execute(servicoproduto.excluiProduto());
%>


<%
//Pesquisa o valor TOTAL do Servi�o para depois subtrair o servi�o que foi excluido
rs02 = st02.executeQuery(servico.pesquisaServico());

float totalServico = 0;

if(rs02.next()){
	totalServico = rs02.getFloat("valor");
}
%>

<%
//Subtrai o valor do servi�o que foi excluido da O.S.
totalServico -= valorServico;

//Atribui ao objeto servico
servico.valor = totalServico;

//Atualiza o valor TOTAL do servi�o
st.execute(servico.atualizaValorServico());
%>


<%
//Direciona para o PDV novamente
response.sendRedirect("sis_update_servico.jsp?servicoID="+servicoproduto.servico.servicoID+"&orcamento="+orcamento);
%>

<%
//fecha Statment
st.close();
%>