<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/seguranca.jsp" %>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<jsp:useBean id="servicoitem" class="servico.ServicoItem" scope="page"></jsp:useBean>

<jsp:useBean id="servicoproduto" class="servico.ServicoProduto" scope="page"></jsp:useBean>

<jsp:useBean id="servicometroquadrado" class="servico.ServicoMetroQuadrado" scope="page"></jsp:useBean>

<jsp:useBean id="servicoporcentagem" class="servico.ServicoPorcentagem" scope="page"></jsp:useBean>

<jsp:useBean id="contrato" class="servico.Contrato" scope="page"></jsp:useBean>

<jsp:useBean id="empresa" class="cadastro.Empresa" scope="page"></jsp:useBean>

<jsp:useBean id="formatar" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="forma" class="pdv.FormaPagamento" scope="page"></jsp:useBean>

<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>

<jsp:useBean id="cliente" class="cadastro.Cliente" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="data1" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="moeda" class="formatar.Moeda" scope="page"></jsp:useBean>

<jsp:useBean id="receber" class="financeiro.Receber" scope="page"></jsp:useBean>

<jsp:useBean id="endereco" class="servico.EnderecoEntrega" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statemenet para auxiliar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
Statement st04 = con.createStatement();
Statement st05 = con.createStatement();
Statement st06 = con.createStatement();
Statement st07 = con.createStatement();
Statement st08 = con.createStatement();
Statement st09 = con.createStatement();
Statement st010 = con.createStatement();
Statement st011 = con.createStatement();
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
ResultSet rs07 = null;
ResultSet rs08 = null;
ResultSet rs09 = null;
ResultSet rs010 = null;
ResultSet rs011 = null;
%>

<%
//Usado para formatar Valores
Currency currency = Currency.getInstance("BRL");     
DecimalFormat formato = new DecimalFormat("R$ #,##0.00");
%>

<%
//Verifica se foi passado servicoID como parametro via URL
if(request.getParameter("servicoID")!=null){
	servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));
}else{
	response.sendRedirect("sis_menu.jsp");
}
%>

<%
//Pesquisa informaçoes sobre o Serviço
rs = st.executeQuery(servico.pesquisaServico());
	
String numContrato = "";
String dataInicio = "";
String dataFechamento = "";
String dataInc = "";
String faltaPagar1 = "";
double faltaPagarExtenso = 0;
String valorTotal = "";
double valorExtenso = 0;
String valorTotalSemDesconto = "";
double valorExtensoSemDesconto = 0;
String adiantamento = "";
double adiantamentoExtenso = 0;
String clienteNome = "";
String clienteResponsavel = "";
String clienteRg = "";
String clienteCNPJ = "";
String clienteInscEstadual = "";
String clienteEndereco = "";
String clienteNumero = "";
String clienteBairro = "";
String clienteCep = "";
String clienteCidade = "";
String clienteUf = "";
boolean obraFlag = false;
String obraEndereco = "";
String obraNumero = "";
String obraBairro = "";
String obraCep = "";
String obraCidade = "";
String obraUf = "";
String tipoPessoa = "";
String numeroART = "";
double totalItem = 0;
double totalProduto = 0;
int vez = 0;
String parcela = "";
double parcelaExtenso = 0;
String descontoEntrada = "";
String diretor = "";

	
	//Se a consulta trouxe algum resultado será atribuido às variáveis
	if(rs.next()){
	
		//Pesquisa Outros Serviços para subtrair do valor total do Contrato
		servicoitem.servico.servicoID = servico.servicoID;
		rs08 = st08.executeQuery(servicoitem.listaItens());
		
		while(rs08.next()){
			totalItem += rs08.getDouble("valor");
		}
		
		//Pesquisa Os produtos que foram adicionados para subtrair do valor total do Contrato
		servicoproduto.servico.servicoID = servico.servicoID;
		rs09 = st09.executeQuery(servicoproduto.listaProdutos());
		
		while(rs09.next()){
			totalProduto += rs09.getDouble("valor");
		}
		
		numContrato = rs.getString("contrato")+"/"+rs.getString("dataContrato").substring(0,4);
		cliente.clienteID = rs.getInt("clienteID");
		dataInicio = data.converteDeData(rs.getString("dataInicio"));
		dataFechamento = data.converteDeData(String.valueOf(rs.getDate("dataContrato")));
		dataInc = String.valueOf(rs.getDate("dataContrato"));
		faltaPagar1 = formato.format(rs.getDouble("valor")-totalItem-totalProduto);
		faltaPagarExtenso = (rs.getDouble("valor")-totalItem-totalProduto);
		vez = rs.getInt("vezes");
		parcela = formato.format((rs.getDouble("valor")-totalItem-totalProduto)/vez);
		parcelaExtenso = ((rs.getDouble("valor")-totalItem-totalProduto)/vez);
		valorTotal = formato.format(rs.getDouble("valor")+rs.getDouble("entradaAd")-totalItem-totalProduto);
		valorExtenso = (rs.getDouble("valor")+rs.getDouble("entradaAd")-totalItem-totalProduto);
		valorTotalSemDesconto = formato.format(rs.getDouble("valor")+rs.getDouble("entradaAd")+rs.getDouble("desconto")-totalItem-totalProduto);
		valorExtensoSemDesconto = (rs.getDouble("valor")+rs.getDouble("entradaAd")+rs.getDouble("desconto")-totalItem-totalProduto);
		descontoEntrada = formato.format(rs.getDouble("desconto"));
		if(rs.getString("tipo").equals("C")){
			adiantamento = formato.format(rs.getDouble("entradaAd"));
			adiantamentoExtenso = rs.getDouble("entradaAd");
		}
		numeroART = rs.getString("numeroART");
		
		//Pesquisa dados do cliente que está fechando contrato
		rs07 = st07.executeQuery(cliente.clientePorID());
		if(rs07.next()){
			clienteNome = rs07.getString("clienteNomeFantasia");
			clienteResponsavel = rs07.getString("clienteContato");
			clienteRg = rs07.getString("clienteInscMunicipal");
			clienteCNPJ = rs07.getString("clienteCnpj");
			if(rs07.getString("clienteInscEstadual").equals("")){
				clienteInscEstadual = "ISENTO";
			}else{
				clienteInscEstadual = rs07.getString("clienteInscEstadual");
			}
			clienteEndereco = rs07.getString("clienteEndereco");
			clienteNumero = rs07.getString("clienteNumero");
			clienteBairro = rs07.getString("clienteBairro");
			clienteCep = rs07.getString("clienteCep");
			clienteUf = rs07.getString("clienteUf");
			clienteCidade = rs07.getString("clienteCidade");
			tipoPessoa = rs07.getString("tipoPessoa");
		}
		
		//Pesquisa dados da Obra.
		endereco.servico.servicoID = servico.servicoID;
		
		rs011 = st011.executeQuery(endereco.enderecoPorServicoID());
		
		if(rs011.next()){
			obraFlag = true;
			obraEndereco = rs011.getString("logradouro")+", "+rs011.getString("complemento");
			obraNumero = rs011.getString("numero");
			obraCep = rs011.getString("cep");
			obraBairro = rs011.getString("bairro");
			obraCidade = rs011.getString("cidade");
			obraUf = rs011.getString("uf");
		}
		
	}
%>

<%
//Psquisa todos os itens adicionados ao Serviço
servicoitem.servico.servicoID = servico.servicoID;
rs01 = st01.executeQuery(servicoitem.listaItens());
%>


<%
//Pesquisa todos os produtos adicionados ao Servico
servicoproduto.servico.servicoID = servico.servicoID;
rs02 = st02.executeQuery(servicoproduto.listaProdutos());
%>


<%
//Pesquisa todos os servicos por metro quadrado adicionados ao Servico
servicometroquadrado.servico.servicoID = servico.servicoID;
rs03 = st03.executeQuery(servicometroquadrado.listaItens());
%>

<%
//Pesquisa todos os servicos por porcentagem adicionados ao Servico
servicoporcentagem.servico.servicoID = servico.servicoID;
rs04 = st04.executeQuery(servicoporcentagem.listaItens());
%>


<%
//Pesquisa os dados da Empresa para colocar no Cupom
empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
rs05 = st05.executeQuery(empresa.dadosGerais());
%>


<%
//Pesquisa informações sobre o Modelo de Contrato Padrão
contrato.contratoID = 1;
rs06 = st06.executeQuery(contrato.textoContrato());
%>


<%
//Pesquisa data de Vencimento
receber.venda.vendaID = servico.servicoID;
receber.dataInclusao = dataInc;
//out.print(receber.venda.vendaID+"<BR>");
//out.print(receber.dataInclusao+"<BR>");
rs010 = st010.executeQuery(receber.contaReceberPorVendaID());

String diaVencimento = dataInc.substring(8,10);

if(rs010.next()){
	diaVencimento = rs010.getString("vencimento");
	diaVencimento = diaVencimento.substring(8,10);	
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
	//if(confirm("Deseja Fechar?")){
	//	fechar();
	//	}
}

function fechar(){
	window.location.href="sis_view_contratos.jsp";	
}

</script>

<style type="text/css">

body{
	margin-top:0px;
	margin-bottom:0px;
}

.style1 {
	font-size: 12px;
	font-weight: bold;
}
</style>

</head>
<body bgcolor="#EEEEEE" onLoad="javascript: imprimirCupom()">


<div id="cupom" style="background-color:#FFFFFF; width:630px; font-family:Verdana, Geneva, sans-serif; font-size:10px; margin-left:auto; margin-right:auto;">

<table width="590" height="978" align="center">
<%
if(rs05.next()){

diretor = rs05.getString("responsavel");
%>
<tr>
  <td width="142" rowspan="7" align="left" valign="top"><img src="relatorios/images/logo_relatorio.png" border="0" title="Iprimir Relatorio"></td>
  <td width="432" height="9" align="center"><strong><%=rs05.getString("razaoSocial") %></strong></td>
  </tr>
<tr>
  <td height="9"><div align="center"><%=rs05.getString("rua") %>, <%=rs05.getString("numero") %>, <%=rs05.getString("bairro") %>, <%=rs05.getString("cidade") %> - <%=rs05.getString("uf") %></div></td>
  </tr>
<tr>
  <td height="9"><div align="center">Tel:<%=rs05.getString("telefone") %>&nbsp;&nbsp;Cel:<%=rs05.getString("celular") %></div></td>
  </tr>
<tr>
  <td height="20"><div align="center">CNPJ: <%=rs05.getString("cnpj") %>&nbsp;&nbsp;/&nbsp;&nbsp;Insc. Estadual: <%=rs05.getString("inscEstadual") %></div></td>
  </tr>
<tr>
  <td height="20"><div align="center">CEP:<%=rs05.getString("cep") %> &nbsp;Email:<%=rs05.getString("email") %></div></td>
  </tr>
<tr>
  <td height="20" align="left"><div align="center"><%=rs05.getString("site") %></div></td>
  </tr>
<tr>
  <td height="20"><div align="center"></div></td>
</tr>
<%}%>
<tr>
<td colspan="2" valign="top">

<table width="578" align="center" cellpadding="0" cellspacing="0">
<%//if(rs.next()){ %>
   <tr>
     <td height="25" align="center" valign="middle"><hr style="border:1px solid #CCCCCC" /></td>
   </tr>
    <tr bgcolor="#EEEEEE">
      <td align="center"><span class="style1">CONTRATO DE PRESTA&Ccedil;&Atilde;O DE SERVI&Ccedil;O</span></td>
    </tr>
    <tr>
     <td>
      
      <table width="575" align="center">
       
  <tr>
    <td width="85" align="left">N&deg; Contrato</td>
    <td colspan="2" align="left"><%=numContrato %></td>
    <td width="80" align="left">Cliente</td>
    <td width="212" align="left"><%=clienteNome%></td>
  </tr>
  <tr>
    <td align="left">Or&ccedil;amento</td>
    <td colspan="2" align="left"><%=dataInicio%></td>
    <td colspan="2" align="left">Fechamento do Contrato dia&nbsp; &nbsp; <%=dataFechamento %></td>
    </tr>
  <tr bgcolor="#F9F6F2">
    <td align="left">VALOR TOTAL</td>
    <td width="86" align="left"><font color="#009900"><strong><%=valorTotalSemDesconto %></strong></font></td>
    <td width="88" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DESCONTO</td>
    <td align="left"><strong><%=descontoEntrada%></strong></td>
    <td align="left">TOTAL (com desconto) <strong><%=valorTotal%></strong></td>
  </tr>
  <tr bgcolor="#F9F6F2">
    <td align="left">ADIANTAMENTO</td>
    <td width="86" align="left"><font color="#009900"><strong><%=adiantamento %></strong></font></td>
    <td width="88" align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
    <td align="left">N&uacute;mero ART <strong><%=numeroART%></strong></td>
  </tr>
  <tr>
    <td colspan="5" height="25" align="center" valign="middle"><hr style="border:1px solid #CCCCCC" /></td>
  </tr>
      </table>     </td>
    </tr>
    <tr>
     <td>
     <p align="justify"><strong>IDENTIFICA&Ccedil;&Atilde;O DAS PARTES CONTRATANTES</strong> <br>
         <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
     <%if(tipoPessoa.equals("0")){ %>
         <strong>CONTRATANTE:</strong>&nbsp; <strong><%=clienteNome %></strong>, Carteira de Identidade n&ordm; <strong><%=clienteRg %></strong>, C.P.F. n&ordm;  <strong><%=clienteCNPJ %></strong>, residente e domiciliado na <strong><%=clienteEndereco %></strong>, n&ordm; <strong><%=clienteNumero %></strong>, bairro <strong><%=clienteBairro %></strong>,  Cep <strong><%=clienteCep %></strong>, Cidade <strong><%=clienteCidade %></strong>, no Estado <strong><%=clienteUf %></strong> <br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
  	 <%}else{ %>
         <strong>CONTRATANTE:</strong>&nbsp; <strong><%=clienteNome %></strong>, Inscri&ccedil;&atilde;o Estadual n&ordm; <strong><%=clienteInscEstadual %></strong>, C.N.P.J. n&ordm;  <strong><%=clienteCNPJ %></strong>,  estabelecido na <strong><%=clienteEndereco %></strong>, n&ordm; <strong><%=clienteNumero %></strong>, bairro <strong><%=clienteBairro %></strong>,  Cep <strong><%=clienteCep %></strong>, Cidade <strong><%=clienteCidade %></strong>, no Estado <strong><%=clienteUf %></strong>; nesta ato representada por: <strong><%=clienteResponsavel%></strong><br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>    
     <%} %>
  
  	 <%
  	 //Verifica se Existe um endereço para obra
  	 if(obraFlag){
  		 if(!rs011.getString("logradouro").equals("")){
  	 %>   
  <strong>ENDERE&Ccedil;O DA OBRA:</strong> <%=obraEndereco %>, Bairro: <%=obraBairro %>, CEP: <%=obraCep %>, Cidade: <%=obraCidade %>, UF: <%=obraUf %><br><br>
     <%
  		 }
     } 
     %>
  
  <strong>CONTRATADA:</strong>&nbsp;<strong>WBS&amp;MPA Engenharia e Com&eacute;rcio LTDA</strong>, com sede em <strong>V&aacute;rzea Paulista</strong>, na <strong>Rua  Victorio Spinucci</strong>, n&ordm; <strong>264</strong>, bairro <strong>Jardim Promeca</strong>, Cep  <strong>13223-200</strong>, no Estado <strong>SP</strong>, inscrita no C.N.P.J. sob o n&ordm; <strong>05.374.713/0001-39</strong>, e no Cadastro Estadual sob o n&ordm; <strong>712.103.613.110</strong>, neste  ato representada pelo seu socio/diretor <%=diretor%>,</p>
     <p align="justify">As partes acima identificadas t&ecirc;m, entre si, justo e acertado o presente  Contrato de Presta&ccedil;&atilde;o de Servi&ccedil;os de Engenharia, que se reger&aacute; pelas cl&aacute;usulas  seguintes e pelas condi&ccedil;&otilde;es de pagamento descritas no  presente.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
     <p align="justify"><strong>DO OBJETO DO CONTRATO</strong>&nbsp;<br>
Cl&aacute;usula 1&ordf;. O presente contrato tem  como OBJETO, a presta&ccedil;&atilde;o, pela CONTRATADA, dos servi&ccedil;os de engenharia &agrave;  CONTRATANTE, a fim de que esta possa implementar seu projeto.<br>
     </p>
     <p align="justify"><strong>DOS SERVI&Ccedil;OS</strong><br>
  Cl&aacute;usula 2&ordf;. Os servi&ccedil;os contratados  neste instrumento constam na cl&aacute;usula 9&ordf; deste contrato.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
Cl&aacute;usula 3&ordf;. Al&eacute;m dos servi&ccedil;os  estabelecidos na cl&aacute;usula 9&ordf;, a CONTRATADA prestar&aacute; tamb&eacute;m as informa&ccedil;&otilde;es  t&eacute;cnicas necess&aacute;rias &agrave; implementa&ccedil;&atilde;o do projeto, devendo tamb&eacute;m ceder &agrave;  CONTRATANTE os direitos decorrentes dos processos utilizados na consecu&ccedil;&atilde;o  daquele.<br>
     </p>
     <p align="justify"><strong>DAS OBRIGA&Ccedil;&Otilde;ES</strong><br>
  Cl&aacute;usula 4&ordf;. Os servi&ccedil;os e as  informa&ccedil;&otilde;es t&eacute;cnicas espec&iacute;ficas utilizadas na consecu&ccedil;&atilde;o do projeto dever&atilde;o  ser utilizados &uacute;nica e exclusivamente para o fim estabelecido neste  instrumento, n&atilde;o podendo a CONTRATANTE utiliz&aacute;-los para outros projetos que por  ventura esteja desenvolvendo.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
Cl&aacute;usula 5&ordf;. A CONTRATANTE n&atilde;o poder&aacute;  repassar as informa&ccedil;&otilde;es t&eacute;cnicas relativas aos servi&ccedil;os prestados para  terceiros, salvo no caso de se tratar de necessidade para a implementa&ccedil;&atilde;o do  projeto.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
Par&aacute;grafo &uacute;nico. As informa&ccedil;&otilde;es  t&eacute;cnicas que n&atilde;o poder&atilde;o ser passadas pela CONTRATANTE ser&atilde;o aquelas  consideradas sigilosas, ou seja, que n&atilde;o estejam protegidas atrav&eacute;s de  concess&atilde;o de patente.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
<br>
     <strong>DA MULTA</strong><br>
     Cl&aacute;usula 6&ordf;. A parte que descumprir  qualquer cl&aacute;usula estabelecida neste instrumento se responsabilizar&aacute; por multa  de 50% do valor a ser pago pela presta&ccedil;&atilde;o dos servi&ccedil;os.</p>
       </td>
    </tr>
    <%//} %>
</table></td>
 </tr>
 <tr>
 <td align="left" height="10"><a href="javascript: fechar()" style="text-decoration:none" title="FECHAR RELAT&Oacute;RIO">[ x ]</a></td>
</tr>
</table>
</div>


<div id="cupom" style="background-color:#FFFFFF; width:630px; font-family:Verdana, Geneva, sans-serif; font-size:10px; margin-left:auto; margin-right:auto;">

<table width="590" height="978" align="center">
<%
//Realiza a pesquisa novamente sobre os dados da empresa
rs05 = st05.executeQuery(empresa.dadosGerais());
if(rs05.next()){
%>
<tr>
  <td width="142" rowspan="7" align="left" valign="top"><img src="relatorios/images/logo_relatorio.png" border="0" title="Iprimir Relatorio"></td>
  <td width="432" height="9" align="center"><strong><%=rs05.getString("razaoSocial") %></strong></td>
  </tr>
<tr>
  <td height="9"><div align="center"><%=rs05.getString("rua") %>, <%=rs05.getString("numero") %>, <%=rs05.getString("bairro") %>, <%=rs05.getString("cidade") %> - <%=rs05.getString("uf") %></div></td>
  </tr>
<tr>
  <td height="9"><div align="center">Tel:<%=rs05.getString("telefone") %>&nbsp;&nbsp;Cel:<%=rs05.getString("celular") %></div></td>
  </tr>
<tr>
  <td height="20"><div align="center">CNPJ: <%=rs05.getString("cnpj") %>&nbsp;&nbsp;/&nbsp;&nbsp;Insc. Estadual: <%=rs05.getString("inscEstadual") %></div></td>
  </tr>
<tr>
  <td height="20"><div align="center">CEP:<%=rs05.getString("cep") %> &nbsp;Email:<%=rs05.getString("email") %></div></td>
  </tr>
<tr>
  <td height="20" align="left"><div align="center"><%=rs05.getString("site") %></div></td>
  </tr>
<tr>
  <td height="20"><div align="center"></div></td>
</tr>
<%}%>
<tr>
<td colspan="2" valign="top">

  <p align="justify"><strong>DO PAGAMENTO</strong><br>
       Cl&aacute;usula 7&ordf;. Pela presta&ccedil;&atilde;o dos  servi&ccedil;os acertados, a CONTRATANTE pagar&aacute; &agrave; CONTRATADA a quantia de<strong> <%=valorTotal %></strong> (<strong><%=moeda.valorPorExtenso(valorExtenso) %></strong>), sendo que <strong><%=adiantamento %></strong> (<strong><%=moeda.valorPorExtenso(adiantamentoExtenso) %></strong>) foi pago no dia da assinatura deste contrato, e o restante de <strong><%=faltaPagar1 %></strong> (<strong><%=moeda.valorPorExtenso(faltaPagarExtenso) %></strong>), dividido em <strong><%=vez%></strong> parcela(s) de <strong><%=parcela%></strong>(<strong><%=moeda.valorPorExtenso(parcelaExtenso) %></strong>), com vencimento para todo o dia <%=diaVencimento%>.</p>
  <p align="justify"><strong>DA RESCIS&Atilde;O</strong><br>
Cl&aacute;usula 8&ordf;. O presente instrumento ser&aacute;  rescindido caso uma das partes descumpra o estabelecido em qualquer uma das  cl&aacute;usulas deste contrato, sem isso implicar na n&atilde;o aplica&ccedil;&atilde;o da multa prevista  na cl&aacute;usula 6&ordf;.</p><br>
<!-- INICIO DA LISTAGEM DE ITENS -->

 <table align="center" cellpadding="0" cellspacing="0">
  <tr>
   <td colspan="4"><p><strong>SERVI&Ccedil;OS T&Eacute;CNICOS CONTRATADOS</strong><br>
  Cl&aacute;usula 9&ordf;.</p>     </td>
  </tr>
  <%
  if(rs03.next()){
  rs03 = st03.executeQuery(servicometroquadrado.listaItens());
  %>
  <tr bgcolor="#CCCCCC">
    <td colspan="4" align="center"><font color="#000000">---------------------------------- SERVI&Ccedil;OS POR m&sup2; (METRO QUADRADO)&nbsp;------------------------------</font></td>
    </tr>
  <tr>
    <td colspan="4" align="center">
  		
        <table width="570" align="center">
        <%while(rs03.next()){%>
        <%
		//Verifica se a unidade de medida é metro quadrado ou VB
		String uniMed = "m&sup2;";
		if(rs03.getString("tipo").equals("V")){
			uniMed = "VB";
		}
		%>
         <tr>
          <td width="313" align="left"><%=rs03.getString("descricao") %></td>
          <td width="120" align="left"><%=rs03.getString("quantidade").replace(".00","").replace(".",",") %> <%=uniMed%></td>
          <td width="79" align="right"><%=formato.format(rs03.getDouble("valor")) %></td>
          <td width="38" align="center"></td>
         </tr>
         <%} %>
        </table>    </td>
  </tr>
  <%}%>
  <%
   if(rs04.next()){
   rs04 = st04.executeQuery(servicoporcentagem.listaItens());
  %>
  <tr bgcolor="#CCCCCC">
    <td colspan="4" align="center"><font color="#000000">------------------------------------ SERVI&Ccedil;OS POR</font><font color="#000000"> % (PORCENTAGEM)&nbsp;----------------------------------</font></td>
    </tr>
  <tr>
    <td colspan="4" align="center">
  		
        <table width="570" align="center">
        <%while(rs04.next()){%>
         <tr>
          <td width="314" align="left"><%=rs04.getString("descricao")%></td>
          <td width="120" align="left"><%=rs04.getString("quantidade").replace(".00","").replace(".",",")%> %</td>
          <td width="78" align="right"><%=formato.format(rs04.getDouble("valor"))%></td>
          <td width="38" align="center"></td>
         </tr>
         <%}%>
        </table>     </td>
  </tr>
  <%}%>
  <%
   if(1==2){
   //if(rs01.next()){
   rs01 = st01.executeQuery(servicoitem.listaItens());
  %>
  <tr>
  <tr valign="middle" bgcolor="#CCCCCC">
    <td colspan="4" align="center"><font color="#000000">--------------------------------------------- OUTROS SERVI&Ccedil;OS -------------------------------------------</font></td>
    </tr>
  <tr>
    <td colspan="4" align="center">
  		
        <table width="570" align="center">
        <%while(rs01.next()){ %>
         <tr>
          <td width="437" align="left"><%=rs01.getString("descricao") %></td>
          <td width="80" align="right"><%=formato.format(rs01.getDouble("valor")) %></td>
          <td width="37" align="center">&nbsp;</td>
         </tr>
         <%} %>
        </table>     </td>
  </tr>
  <%}%>
  <%
   if(1==2){
   //if(rs02.next()){
   rs02 = st02.executeQuery(servicoproduto.listaProdutos());
  %>
  <tr align="center" valign="middle" bgcolor="#CCCCCC">
    <td colspan="4"><font color="#000000">----------------------------------------- PRODUTOS ADICIONADOS ---------------------------------------</font></td>
    </tr>
  <tr>
    <td colspan="4" align="center">
    
      <table width="570" align="center">
        <%while(rs02.next()){ %>
         <tr>
          <td width="437" align="left"><%=rs02.getString("nome") %></td>
          <td width="80" align="right"><%=formato.format(rs02.getDouble("valor")) %></td>
          <td width="37" align="center">&nbsp;</td>
         </tr>
         <%} %>
                
        <tr>
         <td align="left" colspan="4" height="15"></td>
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
        //Formata os valores para Moeda e atribui as variaveis
        total = formato.format(rs.getDouble("valor") + rs.getDouble("desconto"));
        totalParcial = formato.format(rs.getDouble("valor"));
        desconto = formato.format(rs.getDouble("desconto"));
        pago = formato.format(rs.getDouble("entrada"));
        troco = formato.format(rs.getDouble("troco"));
        faltaPagar = formato.format(rs.getDouble("valor") - rs.getDouble("entrada"));
        devendo = rs.getDouble("valor") - rs.getDouble("entrada");
        valorParcela = formato.format(devendo / rs.getDouble("vezes"));
        %>
        
        <%
        //Recupera o ID da Forma de Pagamento e pesquisa o nome
        forma.formPagID = rs.getInt("formPagID");
        
        String formaPagamento = "";
        
        rs03 = st03.executeQuery(forma.formaPorID());
        
        //Verifica se retornou algum resultado e atribui a variavel
        if(rs03.next()){
            formaPagamento = rs03.getString("descricao");
        }
        %>
        <%if(rs.getDouble("desconto") > 0){%>
        <%}%>
        
        <% if(forma.formPagID != 1){ %>
        <%}%>
        <% if(forma.formPagID != 1){ %>
        
         <%
         String vezes = "";
         if(rs.getInt("vezes") == 1){
             vezes = "Á Vista ";
         }else{
             vezes = rs.getString("vezes")+" x ";
         }
         %>
        <%}else{%>
        <%}%>
        </table>      </td>
    </tr>
    <%}%>
    <tr>
      <td colspan="4" height="25" align="center" valign="middle"><hr style="border:1px solid #CCCCCC" /></td>
    </tr>
    <tr>
      <td colspan="4" align="left">
        <strong>DO FORO</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
Cl&aacute;usula 10&ordf;. Para dirimir quaisquer  controv&eacute;rsias oriundas do CONTRATO, as partes elegem o foro da comarca de  V&aacute;rzea Paulista.      <br>
<br></td>
	</tr>
    <tr>
	<td colspan="4" height="25" align="left" valign="middle"><hr style="border:1px solid #CCCCCC" /></td>
    </tr>  
 </table>
 
<!-- FIM DA LISTAGEM DE ITENS -->

<table width="582" align="center">
  <tr>
    <td height="40" colspan="2" valign="bottom"><p align="justify">Por estarem assim justos e contratados,  firmam o presente instrumento, em duas vias de igual teor, juntamente com 2  (duas) testemunhas.<br>
      <br>
      V&aacute;rzea Paulista, SP, <%=data.dataAtual() %></p>      </td>
  </tr>
  <tr>
    <td colspan="2" height="30"></td>
  </tr>
  <tr>
    <td width="278" align="center">_________________________________________</td>
    <td width="278" align="center">_________________________________________</td>
  </tr>
  <tr>
    <td align="center">WBS&amp;MPA Engenharia e Com&eacute;rcio LTDA</td>
    <td align="center"><%=clienteNome %></td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" height="30"></td>
  </tr>
  <tr>
    <td align="center">_________________________________________</td>
    <td align="center">________________________________________</td>
  </tr>
  <tr>
    <td align="center">Testemunha 1</td>
    <td align="center">Testemunha 2</td>
  </tr>
</table></td>
</tr>
<tr>
 <td align="left" height="10"><a href="javascript: fechar()" style="text-decoration:none" title="FECHAR RELAT&Oacute;RIO">[ x ]</a></td>
</tr>
</table>

</div>


<!--<div id="cupom" style="background-color:#FFFFFF; width:630px; font-family:Verdana, Geneva, sans-serif; font-size:10px; margin-left:auto; margin-right:auto;">

<table width="590" height="978" align="center">
<%
//Realiza a pesquisa novamente sobre os dados da empresa
rs05 = st05.executeQuery(empresa.dadosGerais());
if(rs05.next()){
%>
<tr>
  <td width="142" rowspan="7" align="left" valign="top"><img src="relatorios/images/logo_relatorio.png" border="0" title="Iprimir Relatorio"></td>
  <td width="432" height="9" align="center"><strong><%=rs05.getString("nomeFantasia") %></strong></td>
  </tr>
<tr>
  <td height="9"><%=rs05.getString("rua") %>, <%=rs05.getString("numero") %></td>
  </tr>
<tr>
  <td height="9"><%=rs05.getString("bairro") %></td>
  </tr>
<tr>
  <td height="20"><%=rs05.getString("cidade") %> - <%=rs05.getString("uf") %></td>
  </tr>
<tr>
  <td height="20"><%=rs05.getString("telefone") %></td>
  </tr>
<tr>
  <td height="20">CNPJ: <%=rs05.getString("cnpj") %></td>
  </tr>
<tr>
  <td height="20">Insc. Estadual: <%=rs05.getString("inscEstadual") %></td>
</tr>
<%}%>
<tr>
<td colspan="2" valign="top">&nbsp;</td>
 </tr>
 <tr>
 <td align="left" height="10"><a href="javascript: fechar()" style="text-decoration:none" title="FECHAR RELAT&Oacute;RIO">[ x ]</a></td>
</tr>
</table>
</div>-->

</body>
</html>