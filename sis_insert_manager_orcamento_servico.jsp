<%@ page errorPage="index.jsp?msg=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/seguranca.jsp" %>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="data1" class="formatar.Datas" scope="page"></jsp:useBean>


<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
%>


<%
//Instancia um objeto do tipo Resultset para receber o resultado de uma busca
ResultSet rs01 = null;
ResultSet rs02 = null;
%>


<%
//Recupera valores do formul�rio e atribui ao objeto servico
servico.cliente.clienteID 	= Integer.parseInt(request.getParameter("clienteID"));
servico.empresa.empresaID	= Integer.parseInt((String)session.getAttribute("empresaID"));
servico.descricao			= request.getParameter("descricao");
servico.dataInicio 			= data.converteParaData(data.dataAtual());
servico.valor				= Float.parseFloat(request.getParameter("valor"));
servico.usuario.usuarioID	= Integer.parseInt((String)session.getAttribute("usuarioID"));
servico.contrato			= 0;
%>


<%
//Pesquisa o ultimo numero de or�amento cadastrado na tabela servico e gera o proximo
servico.orcamento = 0;

rs02 = st02.executeQuery(servico.ultimoServicoAno(data1.anoAtual()));

if(rs02.next()){
	servico.orcamento = rs02.getInt("orcamento");
}

	servico.orcamento += 1;

%>


<%
//Executa a Query q ir� salvar o Servi�o
st.execute(servico.cadastraServico());
%>


<%
//Para gerar um cupom pesquisa na base de dados qual foi o �ltimo servi�o gerado
rs01 = st01.executeQuery(servico.ultimoServico());

int servicoID = Integer.MIN_VALUE;

if(rs01.next()){
	servicoID = rs01.getInt("servicoID");
}

%>


<%
//Direciona para a impress�o de um cupom para o cliente
response.sendRedirect("sis_view_orcamento_servicos.jsp?msg=1");
%>

<%
//fecha Statment
st.close();
%>