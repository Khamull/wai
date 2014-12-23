<%@ page errorPage="index.jsp?msg=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/seguranca.jsp" %>

<jsp:useBean id="servicoitem" class="servico.ServicoItem" scope="page"></jsp:useBean>

<jsp:useBean id="servicoporcentagem" class="servico.ServicoPorcentagem" scope="page"></jsp:useBean>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>


<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
%>

<%
//Instancia um objeto do tipo Resulset para receber o valor de uma consulta
ResultSet rs01 = null;
ResultSet rs02 = null;
%>

<%
//Variavel que verifica se � um or�amento ou n�o
String orcamento = "";
%>

<%
//Recupera valores do formul�rio e atribui ao objeto servicoporcentagem
servicoporcentagem.servicoporcentagemID = Integer.parseInt(request.getParameter("servicoporcentagemID"));
servicoporcentagem.servico.servicoID	= Integer.parseInt(request.getParameter("servicoID"));
servico.servicoID = servicoporcentagem.servico.servicoID;
orcamento = request.getParameter("orc");
%>


<%
//Pesquisa o valor desse servi�o
rs01 = st01.executeQuery(servicoporcentagem.servicoPorID());

float valorServico = 0;

if(rs01.next()){
	valorServico = rs01.getFloat("valor");
}

%>


<%
//Exclui o Servi�o
st.execute(servicoporcentagem.excluirServico());
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
response.sendRedirect("sis_update_servico.jsp?servicoID="+servicoporcentagem.servico.servicoID+"&orcamento="+orcamento);
%>

<%
//fecha Statment
st.close();
%>