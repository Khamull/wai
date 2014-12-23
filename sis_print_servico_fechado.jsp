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

<%
//Instancia um objeto do tipo Statemenet para auxiliar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
Statement st04 = con.createStatement();
Statement st05 = con.createStatement();
Statement st06 = con.createStatement();
Statement st07 = con.createStatement();
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
//Usado para formatar Valores
Currency currency = Currency.getInstance("BRL");     
DecimalFormat formato = new DecimalFormat("R$ #,##0.00");
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
	if(document.form1.assinatura.value == "S"){
		window.location.href="sis_view_contratos.jsp";	
	}else{
		window.location.href="sis_servicos_fechados.jsp";
	}
}

</script>

</head>
<body bgcolor="#EEEEEE" onLoad="javascript: imprimirCupom()">

<div id="cupom" style="background-color:#FFFFFF; width:630px; font-family:Verdana, Geneva, sans-serif; font-size:11px; margin-left:auto; margin-right:auto">

<table width="590" align="center">
<%if(rs05.next()){ %>
<tr>
  <td width="142" height="20" rowspan="7" align="left" valign="top"><img src="relatorios/images/logo_relatorio.png" border="0" title="Iprimir Relatorio"></td>
  <td width="432" height="9" align="center"><strong><%=rs05.getString("razaoSocial") %></strong></td>
  </tr>
<tr>
  <td height="9" align="center"><%=rs05.getString("rua") %>, <%=rs05.getString("numero") %> - CEP:<%=rs05.getString("cep") %> </td>
  </tr>
<tr>
  <td height="9" align="center"><%=rs05.getString("bairro") %>, <%=rs05.getString("cidade") %> - <%=rs05.getString("uf") %></td>
  </tr>
<tr>
  <td height="20" align="center">CNPJ: <%=rs05.getString("cnpj") %> - Insc. Estadual: <%=rs05.getString("inscEstadual") %></td>
  </tr>
<tr>
  <td height="20" align="center">Tel:<%=rs05.getString("telefone") %>&nbsp;&nbsp;Cel:<%=rs05.getString("celular") %></td>
  </tr>
<tr>
  <td height="20" align="center">E-mail:<%=rs05.getString("email") %></td>
  </tr>
<tr>
  <td height="20" align="center"><%=rs05.getString("site") %></td>
</tr>
<%}%>
<tr>
<td colspan="2">
<!-- INICIO DA LISTAGEM DE ITENS -->
<%if(rs.next()){ %>
 <table align="center" cellpadding="2" cellspacing="2">
  <tr bgcolor="#EEEEEE">
   <td colspan="4" align="center"><strong>DETALHES DO CONTRATO</strong></td>
  </tr>
  <tr>
    <td width="100" align="left">N&deg; Contrato</td>
    <td width="152" align="left"><%=rs.getString("contrato") %>/<%=rs.getString("dataContrato").substring(0,4)%></td>
    <td width="73" align="left">Cliente</td>
    <td width="221" align="left"><%=rs.getString("clienteNomeFantasia") %></td>
  </tr>
  <tr>
    <td align="left">Or&ccedil;amento</td>
    <td align="left"><%=data.converteDeData(rs.getString("dataInicio")) %></td>
    <td colspan="2" align="left">Fechamento do Contrato dia&nbsp; &nbsp; <%=data.converteDeData(String.valueOf(rs.getDate("dataContrato"))) %></td>
    </tr>
  <tr bgcolor="#F9F6F2">
    <td align="left">VALOR TOTAL</td>
    <td align="left"><font color="#009900"><strong><%=formato.format(rs.getDouble("valor")+rs.getDouble("entradaAd")+rs.getDouble("desconto")) %></strong></font></td>
    <td colspan="2" align="left">
    <%if(rs.getString("tipo").equals("C")){%>
    	ADIANTAMENTO<font color="#009900"><strong>&nbsp;<%=formato.format(rs.getDouble("entradaAd")) %></strong></font>
    <%}%>    </td>
  </tr>
  <tr>
    <td colspan="4" height="25" align="center" valign="middle"><hr style="border:1px solid #CCCCCC" /></td>
  </tr>
  <tr bgcolor="#CCCCCC">
    <td colspan="4" align="center"><font color="#000000">SERVI&Ccedil;OS POR m&sup2; (METRO QUADRADO)&nbsp;</font></td>
    </tr>
  <tr>
    <td colspan="4" align="center">
  		
        <table width="560" align="center">
        <%while(rs03.next()){%>
         <tr>
          <td width="300" align="left"><%=rs03.getString("descricao") %></td>
          <td align="right"><%=formato.format(rs03.getDouble("valor")) %></td>
          <td align="center"></td>
         </tr>
         <tr>
          <td align="center" colspan="3"><hr style="border:1px solid #CCCCCC" /></td>
         </tr>
         <%} %>
        </table>    </td>
  </tr>
  <tr>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
  </tr>
  <tr bgcolor="#CCCCCC">
    <td colspan="4" align="center"><font color="#000000">SERVI&Ccedil;OS POR</font><font color="#000000"> % (PORCENTAGEM)&nbsp;</font></td>
    </tr>
  <tr>
    <td colspan="4" align="center">
  		
        <table width="560" align="center">
        <%while(rs04.next()){%>
         <tr>
          <td width="300" align="left"><%=rs04.getString("descricao")%></td>
          <td align="right"><%=formato.format(rs04.getDouble("valor"))%></td>
          <td align="center"></td>
         </tr>
         <tr>
          <td align="center" colspan="3"><hr style="border:1px solid #CCCCCC" /></td>
         </tr>
         <%}%>
        </table>    </td>
  </tr>
  <tr>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
  </tr>
  <tr>
  <tr valign="middle" bgcolor="#CCCCCC">
    <td colspan="4" align="center"><font color="#000000">OUTROS SERVI&Ccedil;OS</font></td>
    </tr>
  <tr>
    <td colspan="4" align="center">
  		
        <table width="560" align="center">
        <%while(rs01.next()){ %>
         <tr>
          <td width="300" align="left"><%=rs01.getString("descricao") %></td>
          <td align="right"><%=formato.format(rs01.getDouble("valor")) %></td>
          <td align="center">&nbsp;</td>
         </tr>
         <tr>
          <td align="center" colspan="3"><hr style="border:1px solid #CCCCCC" /></td>
         </tr>
         <%} %>
        </table>    </td>
  </tr>
  <tr>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
  </tr>
  <tr align="center" valign="middle" bgcolor="#CCCCCC">
    <td colspan="4"><font color="#000000">PRODUTOS ADICIONADOS</font></td>
    </tr>
  <tr>
    <td colspan="4" align="center">
    
      <table width="560" align="center">
        <%while(rs02.next()){ %>
         <tr>
          <td width="300" align="left"><%=rs02.getString("nome") %></td>
          <td align="right"><%=formato.format(rs02.getDouble("valor")) %></td>
          <td align="center">&nbsp;</td>
         </tr>
         <tr>
          <td align="center" colspan="3"><hr style="border:1px solid #CCCCCC" /></td>
         </tr>
         <%} %>
         
         
         
        <tr>
         <td align="left" colspan="3" height="30"></td>
        </tr>
        </table>       </td>
    </tr>
    <%if(rs06.next()){ %>
    <tr bgcolor="#EEEEEE">
      <td colspan="4" align="center"><strong>RESUMO PAGAMENTO</strong></td>
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
	//Formata os valores para Moeda e atribui às variaveis
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
	
	rs07 = st07.executeQuery(forma.formaPorID());
	
	//Verifica se retornou algum resultado e atribui à variavel
	if(rs07.next()){
		formaPagamento = rs07.getString("descricao");
	}
	%>

    <tr>
      <td align="left" colspan="2">Valor total do Contrato</td>
      <td align="right" colspan="2"><%=formato.format(rs.getDouble("valor")+rs.getDouble("entradaAd")+rs.getDouble("desconto")) %></td>
    </tr>
    <%if(rs.getString("tipo").equals("C")){%>
    <tr>
      <td align="left" colspan="2">Valor pago na assinatura do Contrato</td>
      <td align="right" colspan="2"><%=formato.format(rs.getDouble("entradaAd")) %></td>
    </tr>
    <%}%>
    <tr>
 <td align="left" colspan="2">Valor Total do contrato (-) valor pago na assinatura do contrato</td>
 <td align="right" colspan="2"><strong><%=total %></strong></td>
</tr>
<tr>
 <td align="left" colspan="2">Desconto</td>
 <td align="right" colspan="2"><%=desconto %></td>
</tr>
<%if(rs.getDouble("desconto") > 0){%>
<tr>
 <td align="left" colspan="2">Total Restante com Desconto</td>
 <td align="right" colspan="2"><strong><%=totalParcial%></strong></td>
</tr>
<%}%>

<% if(forma.formPagID != 1){ %>
<tr>
 <td align="left" colspan="2">Entrada</td>
 <td align="right" colspan="2"><%=pago%></td>
</tr>
<tr>
 <td align="left" colspan="2"><%=formaPagamento%></td>
 <td align="right" colspan="2"><%=faltaPagar%></td>
</tr>
<%}%>

<tr>
 <td align="left" colspan="2">Total Pago - <%=data.dataAtual()%></td>
 <td align="right" colspan="2">
 <%if(forma.formPagID != 1 && forma.formPagID != 7){%>
 <strong><%=totalParcial%></strong>
 <%}else{%>
 <strong><%=pago%></strong>
 <%}%> </td>
</tr>
<tr>
 <td align="left" colspan="2">Troco</td>
 <td align="right" colspan="2"><%=troco %></td>
</tr>
<tr>
 <td align="left" colspan="4"><hr></td>
</tr>
<% if(forma.formPagID != 1){ %>

 <%
 String vezes = "";
 if(rs.getInt("vezes") == 1){
	 vezes = "Á Vista ";
 }else{
	 vezes = rs.getString("vezes")+" x ";
 }
 %>

<tr>
 <td align="center" colspan="4">Forma Pgto - <%=formaPagamento %>, <%=vezes%><%=valorParcela%></td>
</tr>
<%}else{%>
<tr>
 <td align="center" colspan="4">Forma Pgto - <%=formaPagamento %></td>
</tr>
<%}%>
<tr>
 <td colspan="4" height="10">&nbsp;</td>
</tr>
<tr>
 <td align="left" colspan="2"><input type="button" name="FECHAR" onClick="javascript: fechar()" value="Fechar" /></td>
 <td align="right" colspan="2"><input type="button" name="IMPRIMIR" onClick="javascript: window.print()" value="Imprimir" /></td>
</tr>

    <tr>
     <td colspan="4"></td>
    </tr>
    <%} %>
 </table>
 <%} %>
<!-- FIM DA LISTAGEM DE ITENS -->

<form name="form1">
 <input type="hidden" name="assinatura" value="<%=request.getParameter("assinatura")%>" >
</form>

</td>
</tr>
</table>

</div>

</body>
</html>