<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/seguranca.jsp" %>

<jsp:useBean id="item" class="pdv.VendaItem" scope="page"></jsp:useBean>

<jsp:useBean id="empresa" class="cadastro.Empresa" scope="page"></jsp:useBean>

<jsp:useBean id="venda" class="pdv.Venda" scope="page"></jsp:useBean>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<jsp:useBean id="servicoItem" class="servico.ServicoItem" scope="page"></jsp:useBean>

<jsp:useBean id="servicoProduto" class="servico.ServicoProduto" scope="page" ></jsp:useBean>

<jsp:useBean id="formatar" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="forma" class="pdv.FormaPagamento" scope="page"></jsp:useBean>

<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>

<jsp:useBean id="cliente" class="cadastro.Cliente" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statemenet para auxiliar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
Statement st04 = con.createStatement();
Statement st05 = con.createStatement();
Statement st06 = con.createStatement();
%>

<%
//Instancia um objeto do tipo Resultset para receber o resultado de uma consulta
ResultSet rs = null;
ResultSet rs01 = null;
ResultSet rs02 = null;
ResultSet rs03 = null;
ResultSet rs04 = null;
ResultSet rs05 = null;
ResultSet rs06 = null;
%>

<%
//Verifica se foi passado vendaID como parametro via URL
if(request.getParameter("servicoID")!=null){
	servicoItem.servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));
	servicoProduto.servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));
	servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));
}else{
	response.sendRedirect("sis_menu.jsp");
}
%>

<%
//Usado para formatar Valores
Currency currency = Currency.getInstance("BRL");     
DecimalFormat formato = new DecimalFormat("R$ #,##0.00");
%>

<%
//Pesquisa os produtos adicionados � O.S.
//rs = st.executeQuery(item.listaItensPorID());
rs = st.executeQuery(servicoProduto.listaProdutosCupom());
%>

<%
//Pesquisa os servi�os adicionados � O.S.
rs06 = st06.executeQuery(servicoItem.listaItens());
%>

<%
//Pesquisa os dados da Empresa para colocar no Cupom
empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
rs01 = st01.executeQuery(empresa.dadosGerais());
%>

<%
//Pesquisa dados do Servi�o
//rs02 = st02.executeQuery(venda.dadosVenda());
rs02 = st02.executeQuery(servico.pesquisaServico());
%>

<%
//Pesquisa o nome do Operador que est� Logado
if(rs02.next()){
	usuario.login = rs02.getString("usuario");
}
rs04 = st04.executeQuery(usuario.usuarioPorLogin());
%>

<%
//Pesquisa dados do Cliente
cliente.clienteID = Integer.parseInt(rs02.getString("clienteID"));

//Variaveis que ir� receber os dados do Cliente
String nome = "";
String cpf = "";

rs05 = st05.executeQuery(cliente.clientePorID());

//Atribui os valores �s variaveis

if(rs05.next()){
	nome = rs05.getString("clienteNomeFantasia");
	cpf = rs05.getString("clienteCnpj");
}
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Currency"%>
<%@page import="java.text.DecimalFormat"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Imprimir Cupom</title>

<script type="text/javascript">

function imprimirCupom(){
	window.print();
	fechar();
}

function fechar(){
	window.location.href="sis_view_servicos.jsp";	
}

</script>

</head>
<body bgcolor="#EEEEEE" onLoad="javascript: imprimirCupom()">

<div id="cupom" style="background-color:#FFFFFF; width:500px; font-family:'Courier New', Courier, monospace; margin-left:auto; margin-right:auto">

<table width="485" align="center">

<tr>
 <td colspan="3" height="20"></td>
</tr>

<%
String dataSemFormatacao = String.valueOf(rs02.getDate("dataFim"));
String data = formatar.converteDeData(dataSemFormatacao);
%>
<tr>
 <td align="left">N&deg; O.S. <%=rs02.getString("servicoID") %></td>
 <td width="158" align="center"><%=data %></td>
 <td align="right"><%=rs02.getTime("dataFim") %></td>
</tr>

<tr>
 <td align="left" colspan="3" height="15"></td>
</tr>
<%if(rs01.next()){ %>
<tr>
 <td align="center" colspan="3"><strong><%=rs01.getString("nomeFantasia") %></strong></td>
</tr>
<tr>
 <td align="left" colspan="3">End: <%=rs01.getString("rua") %>, <%=rs01.getString("numero") %></td>
</tr>
<tr>
 <td align="left" colspan="3">Bairro: <%=rs01.getString("bairro") %></td>
</tr>
<tr>
 <td align="left" colspan="3">Cidade: <%=rs01.getString("cidade") %> - <%=rs01.getString("uf") %></td>
</tr>
<tr>
 <td align="left" colspan="3">Tel: <%=rs01.getString("telefone") %></td>
</tr>
<tr>
 <td align="left" colspan="3">CNPJ: <%=rs01.getString("cnpj") %></td>
</tr>
<tr>
 <td align="left" colspan="3">Insc. Estadual: <%=rs01.getString("inscEstadual") %></td>
</tr>

<%if(rs04.next()){ %>
<tr>
 <td align="left" colspan="3">Operador: <%=rs04.getString("usuarioNome") %></td>
</tr>
<%} %>

<%} %>

<tr>
 <td align="left" colspan="3" height="30"></td>
</tr>
  
  <td align="left" colspan="3">Servi&ccedil;os</td>
</tr>
<tr>
 <td align="left" colspan="3"><hr></td>
</tr>

<%
//Enquanto n�o for final de arquivo lista os servi�os adicionados � O.S.
while(rs06.next()){
%>

  <%
    String preco = null;
          
            
	preco = formato.format(rs06.getDouble("valor"));
	
  %>
 <tr>
  <td colspan="2" align="left"><%=rs06.getString("descricao")%></td>
  <td width="159" align="right">Valor: <%=preco%></td>
 </tr>
 <tr>
  <td colspan="3" height="15"></td>
 </tr>

<%} %>

<tr>
 <td align="left" colspan="3"><hr></td>
</tr>

<tr>
 <td align="left" colspan="3" height="30"></td>
</tr>
<tr>
 <td align="left" colspan="3">Produtos</td>
</tr>
<tr>
 <td align="left" colspan="3"><hr></td>
</tr>

<%
//Enquanto n�o for final de arquivo lista os produtos adicionados � O.S.
while(rs.next()){
%>

  <%
    String preco = null;
	String total = null;
          
            
	preco = formato.format(rs.getDouble("valor"));
	//total = formato.format(rs.getDouble("total"));
	total = "0";
  %>

 <tr>
  <td width="152" align="left"><%=rs.getString("codigo")%></td>
  <td colspan="2" align="left"><%=rs.getString("tipo")%> <%=rs.getString("nome")%></td>
  </tr>
 <tr>
  <td colspan="2" align="left">Valor: <%=preco%> <%=rs.getString("unidade")%></td>
  <td width="159" align="left"></td>
 </tr>
 <tr>
  <td colspan="3" height="15"></td>
 </tr>

<%} %>

<tr>
 <td align="left" colspan="3"><hr></td>
</tr>
<tr>
 <td align="left" colspan="3" height="30"></td>
</tr>

<%
//Declara variaveis para receber valor formatado para Moeda
String total;
String totalParcial;
String desconto;
String pago;
String troco;
String faltaPagar;
double devendo;
String valorParcela;
%>

<%
//Formata os valores para Moeda e atribui �s variaveis
total = formato.format(rs02.getDouble("valor") + rs02.getDouble("desconto"));
totalParcial = formato.format(rs02.getDouble("valor"));
desconto = formato.format(rs02.getDouble("desconto"));
pago = formato.format(rs02.getDouble("entrada"));
troco = formato.format(rs02.getDouble("troco"));
faltaPagar = formato.format(rs02.getDouble("valor") - rs02.getDouble("entrada"));
devendo = rs02.getDouble("valor") - rs02.getDouble("entrada");
valorParcela = formato.format(devendo / rs02.getDouble("vezes"));
%>

<%
//Recupera o ID da Forma de Pagamento e pesquisa o nome
forma.formPagID = rs02.getInt("formPagID");

String formaPagamento = "";

rs03 = st03.executeQuery(forma.formaPorID());

//Verifica se retornou algum resultado e atribui � variavel
if(rs03.next()){
	formaPagamento = rs03.getString("descricao");
}
%>

<tr>
 <td align="left" colspan="2">Total do Pedido</td>
 <td align="right"><strong><%=total %></strong></td>
</tr>
<tr>
 <td align="left" colspan="2">Desconto</td>
 <td align="right"><%=desconto %></td>
</tr>
<%if(rs02.getDouble("desconto") > 0){%>
<tr>
 <td align="left" colspan="2">Total com Desconto</td>
 <td align="right"><strong><%=totalParcial%></strong></td>
</tr>
<%}%>

<% if(forma.formPagID != 1){ %>
<tr>
 <td align="left" colspan="2">Entrada</td>
 <td align="right"><%=pago%></td>
</tr>
<tr>
 <td align="left" colspan="2"><%=formaPagamento%></td>
 <td align="right"><%=faltaPagar%></td>
</tr>
<%}%>

<tr>
 <td align="left" colspan="2">Total Pago</td>
 <td align="right">
 <%if(forma.formPagID != 1 && forma.formPagID != 7){%>
 <strong><%=totalParcial%></strong>
 <%}else{%>
 <strong><%=pago%></strong>
 <%}%> </td>
</tr>
<tr>
 <td align="left" colspan="2">Troco</td>
 <td align="right"><%=troco %></td>
</tr>
<tr>
 <td align="left" colspan="3"><hr></td>
</tr>
<% if(forma.formPagID != 1){ %>

 <%
 String vezes = "";
 if(rs02.getInt("vezes") == 1){
	 vezes = "� Vista ";
 }else{
	 vezes = rs02.getString("vezes")+" x ";
 }
 %>

<tr>
 <td align="center" colspan="3">Forma Pgto - <%=formaPagamento %>, <%=vezes%><%=valorParcela%></td>
</tr>
<%}else{%>
<tr>
 <td align="center" colspan="3">Forma Pgto - <%=formaPagamento %></td>
</tr>
<%}%>



<%
//Verifica se � uma venda do tipo (CREDIARIO) e gera um bloco de Assinatura
if(forma.formPagID == 7){
%>

<tr>
 <td height="50" colspan="3"></td>
</tr>
<tr>
 <td align="center" colspan="3">- - - - - - - - - - - - - - - - - - - - - - - -</td>
</tr>
<tr>
 <td height="15" colspan="3"></td>
</tr>
<tr>
 <td height="15" align="center" colspan="3"><u>COMPROVANTE CREDIARIO</u></td>
</tr>
<tr>
 <td height="15" colspan="3"></td>
</tr>
<tr>
 <td align="left">N&deg;: <%=rs02.getString("vendaID") %></td>
 <td align="center"><%=data %></td>
 <td align="right"><%=rs02.getTime("data") %></td>
</tr>
<tr>
 <td height="15" colspan="3"></td>
</tr>
<tr>
 <td align="left" colspan="3"><strong>VALOR: <%=faltaPagar %></strong></td>
</tr>
<tr>
 <td height="15" colspan="3"></td>
</tr>
<tr>
 <td align="left" colspan="3">EU: <%=nome %></td>
</tr>
<tr>
 <td align="left" colspan="3">PORTADOR DO CNPJ / CPF: <%=cpf %></td>
</tr>
<tr>
 <td align="left" colspan="3">RECONHECO E PAGAREI A DIVIDA AQUI REPRESENTADA</td>
</tr>
<tr>
 <td align="center" valign="baseline" height="100" colspan="3">
 <br><br> ________________________________<br>
 Assinatura do Cliente </td>
</tr>

<%} %>

<tr>
 <td align="left" colspan="3"><hr></td>
</tr>
<tr>
<td colspan="3" height="100"></td>
</tr>
<tr>
<td colspan="3">_</td>
</tr>
</table>

</div>

</body>
</html>