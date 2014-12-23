<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<jsp:useBean id="formaPgto" class="pdv.FormaPagamento" scope="page"></jsp:useBean>

<jsp:useBean id="parametro" class="cadastro.Parametros" scope="page"></jsp:useBean>


<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
%>


<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
ResultSet rs01 = null;
ResultSet rs02 = null;
ResultSet rs03 = null;
%>


<%
//Pesquisa todas as formas de pagamento
rs01 = st01.executeQuery(formaPgto.listaFormasPagamento());
%>


<%
//Recupera o ID do serviço trazido via URL
servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));
%>


<%
//Objeto criado para converter para moeda
Currency currency = Currency.getInstance("BRL");

DecimalFormat formato = new DecimalFormat("R$ #,##0.00");
%>

<%
//Consulta a porcentagem de entrada
parametro.codigoParametro = "1";
rs03 = st03.executeQuery(parametro.pesquisaParametroPorCodigo());

int porcentagem = 0;

if(rs03.next()){
	porcentagem = rs03.getInt("valorParametro");
}
%>

<%
//Pesquisa informações relacionadas a esse servico
rs = st.executeQuery(servico.pesquisaServico());

String valorTotal = "";
//String valEntrada = "";
double valTotal = 0;
float entrada = 0;


if(rs.next()){
	
	valTotal = rs.getDouble("valor");
	
	entrada = (rs.getFloat("valor")*porcentagem);
	entrada = (entrada/100);
	
	valorTotal = formato.format(valTotal);
	
	servico.cliente.clienteID = rs.getInt("clienteID");
	//valEntrada = String.valueOf(entrada).replace(".",",");
	
}

%>


<%
//Trata mensagens
//variaveis que serão utilizadas para verificação
String msg = "";
int numeroMsg;
//verifica se foi passado alguma mensagem via URL
if(request.getParameter("msg") != null){
	numeroMsg = Integer.parseInt(request.getParameter("msg"));
	msg = servico.mensagem(numeroMsg);
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.Currency"%>
<%@page import="java.text.DecimalFormat"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2" />
<title>FORTE SYSTEM</title>

<script type="text/javascript">
function verForm(){
	
}


function acertaValor(){
		
	var pago = document.form1.pago.value;
	
	pago = parseFloat(pago);
	pago = pago.toFixed(2);
	pago = pago.replace(".",",");
	
	document.form1.pago.value = pago;
	
	document.form1.pago.focus();
}


function atualizaValor(){

	var entrada = document.form1.pago.value;
	entrada = entrada.replace(",",".");
	entrada = parseFloat(entrada);
	entrada = entrada.toFixed(2);
	
	document.form1.entrada.value = entrada;

}


//Valida se o Campo é Numérico (COM VÍRGULA " , " )
function numero()	{
if (event.keyCode<48 && event.keyCode!=44 || event.keyCode>57 && event.keyCode!=44){return false;} 
}

</script>

<script type="text/javascript" src="js/jquery.js"></script>


<script type="text/javascript" src="js/jquery-1.4.3.min.js"></script>
    <script type="text/javascript" src="js/jquery.pstrength-min.1.2.js"></script>
        <script>
        	$(document).ready(function(){
				$('.password').pstrength();
			});
        </script>

<script type="text/javascript" src="js/interface.js"></script>

<!--[if lt IE 7]>
 <style type="text/css">
 .dock img { behavior: url(iepngfix.htc) }
 </style>
<![endif]-->   

<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/geral.css" rel="stylesheet" type="text/css" />

</head>

<body onLoad="acertaValor()">

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="440">
<tr>
 <td height="25" bgcolor="#EEEEEE">
 <input type="button" class="botao" onclick="javascript: history.back(-1)" value="&lt;&lt; Voltar" />
 </td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">
 <br />
 <form name="form1" method="post" action="sis_pagar_manager_entrada_contrato.jsp">
 <table width="314" align="center" cellpadding="4" cellspacing="4" style="border:1px solid #444444">
  <tr>
   <td colspan="2" align="center" bgcolor="#EEEEEE"><strong>Pagar Entrada</strong></td>
  </tr>
  <tr>
   <td width="128" align="left">Valor Total</td>
   <td width="156" align="left"><%=valorTotal %></td>
  </tr>
  <tr>
   <td align="left">Valor a ser Pago</td>
   <td align="left"><input name="pago" type="text" value="<%=entrada %>" size="10" maxlength="10" onkeypress="atualizaValor(); return numero(this);" onblur="atualizaValor()" /></td>
  </tr>
  <tr>
    <td align="left">Forma de Pagamento</td>
    <td align="left">
    <select name="formID" style="width:150px">
     <%while(rs01.next()){%>
      <option value="<%=rs01.getString("formID")%>"><%=rs01.getString("descricao")%></option>
     <%}%>
    </select>    </td>
  </tr>
  <tr>
    <td align="left">Vezes</td>
    <td align="left">
    <select name="parcelas" id="parcelas" style="width:150px">
     <option value="1">A Vista</option>
     <option value="2">2x</option>
     <option value="3">3x</option>
     <option value="4">4x</option>
     <option value="5">5x</option>
     <option value="6">6</option>
     <option value="7">7x</option>
     <option value="8">8x</option>
     <option value="9">9x</option>
     <option value="10">10x</option>
     <option value="11">11x</option>
     <option value="12">12x</option>
    </select>
    </td>
  </tr>
  <tr>
    <td align="left">&nbsp;</td>
    <td align="left">
    <input type="hidden" name="entrada" maxlength="10" size="10" value="<%=entrada %>" />
    <input type="hidden" name="total" value="<%=valTotal%>" maxlength="10" size="10" />
    <input type="hidden" name="clienteID" value="<%=servico.cliente.clienteID %>" size="10" />
    <input type="hidden" name="observacao" value="&gt;&gt;&gt; ADIANTAMENTO PAGO PELO CLIENTE NA APROVAÇAO DO CONTRATO &lt;&lt;&lt;" /> 
    </td>
  </tr>
  <tr>
   <td align="left"><input name="PAGAR" type="submit" class="botao" value="Pagar" /></td>
   <td align="left">
   <input type="hidden" name="servicoID" value="<%=servico.servicoID%>" />
   </td>
  </tr>
 </table>
 </form>
 </td>
</tr>
</table>
</div>


<div id="rodape"><jsp:include page="inc/rodape.jsp" /></div>

</div>

<script type="text/javascript">
	
	$(document).ready(
		function()
		{
			$('#dock').Fisheye(
				{
					maxWidth: 50,
					items: 'a',
					itemsText: 'span',
					container: '.dock-container',
					itemWidth: 40,
					proximity: 50,
					halign : 'center'
				}
			)
		}
	);

</script>

</body>
</html>