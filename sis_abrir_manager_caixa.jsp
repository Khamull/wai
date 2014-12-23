<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="caixa" class="caixaloja.Caixa" scope="page"></jsp:useBean>

<jsp:useBean id="venda" class="pdv.Venda" scope="page"></jsp:useBean>

<jsp:useBean id="lancamento" class="financeiro.Lancamentos" scope="page"></jsp:useBean>

<jsp:useBean id="retirada" class="caixaloja.Retiradas" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
%>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs01 = null;
ResultSet rs02 = null;
ResultSet rs03 = null;
%>



<%
//Pesquisa ultima Venda que se tornar� a primeira venda do caixa ap�s aberto
venda.usuario.login = (String)session.getAttribute("usuario");
rs01 = st01.executeQuery(venda.ultimaVendaPorUsuario());
int vendaInicial = 1;

	if(rs01.next()){
		vendaInicial = (rs01.getInt("vendaID")+1);
	}

	
	
//Pesquisa ultimo Lan�amento
rs02 = st02.executeQuery(lancamento.ultimoLancamento());
int lancamentoInicial = 1;

	if(rs02.next()){
		lancamentoInicial = (rs02.getInt("lancamentoID")+1);
	}



//Pesquisa ultima Retirada
rs03 = st03.executeQuery(retirada.ultimaRetirada());
int retiradaInicial = 1;

	if(rs03.next()){
		retiradaInicial = (rs03.getInt("retiradaID")+1);
	}

%>


<%
//Recupera valores trazidos do Formul�rio de Abertura de Caixa
//Atrubui eles ao objeto caixa, juntamente com os resultados das consultas acima

caixa.usuario.login = (String)session.getAttribute("usuario");
caixa.funcionario.nome = request.getParameter("funcionarioNome");

	//Trata valor
	String valorIni = request.getParameter("valor");
	caixa.valorInicial = Float.parseFloat(valorIni.replace(",","."));
	
caixa.vendaInicial = vendaInicial;
caixa.lancamentoInicial = lancamentoInicial;
caixa.retiradaInicial = retiradaInicial;
%>

<%
//Abre um novo caixa para o usu�rio que est� logado
st.execute(caixa.abreCaixa());

//Ap�s Aberto o Caixa Redireciona para tela de caixa fechado
response.sendRedirect("sis_fechar_caixa.jsp?msg=1");

%>



