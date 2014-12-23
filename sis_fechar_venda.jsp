<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/seguranca.jsp" %>

<jsp:useBean id="produto" class="cadastro.Produto" scope="page"></jsp:useBean>

<jsp:useBean id="itens" class="pdv.VendaItem" scope="page"></jsp:useBean>

<jsp:useBean id="formas" class="pdv.FormaPagamento" scope="page"></jsp:useBean>

<jsp:useBean id="cliente" class="cadastro.Cliente" scope="page"></jsp:useBean>

<%
//Instacia objeto do tipo Statment para usar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
%>

<%
//Instacia objeto do tipo Resultset para receber resultado de uma consulta
ResultSet rs = null;
ResultSet rs01 = null;
ResultSet rs02 = null;
ResultSet rs03 = null;
%>


<%
//Verifica se foi passado o parametro vendaID via URL
if(request.getParameter("vendaID") != null){
	//Se foi Atribui ele ao objeto itens
	itens.venda.vendaID = Integer.parseInt(request.getParameter("vendaID"));
}else{
	//Sen�o: Redireciona para o Menu Principal
	response.sendRedirect("sis_menu.jsp");
}
//Pesquisa o Subtotal da Venda
rs = st.executeQuery(itens.totalItem());
//Verifica se retornou algum resultado e atribui a uma variavel

String subTotal = "0";
if(rs.next()){
		
	Currency currency = Currency.getInstance("BRL");
	
	DecimalFormat formato1 = new DecimalFormat("R$ #,##0.00");
	
	subTotal = formato1.format(rs.getDouble("subtotal"));
}
%>

<%
//Pesquisa as formas de Pagamento Ativas
rs01 = st01.executeQuery(formas.listaFormasPagamento());
%>

<%
//Pesquisa os Clientes Ativos
rs02 = st02.executeQuery(cliente.listaClientesaAtivos());
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Currency"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>FORTE SYSTEM</title>

<!-- Fa�a o include da lib do jQuery -->
<script type="text/javascript" src="js/cep.js"></script>
<script type="text/javascript" src="js/interface.js"></script>
<script type="text/javascript" src="js/MascaraValidacao.js"></script> 


<!--[if lt IE 7]>
 <style type="text/css">
 .dock img { behavior: url(iepngfix.htc) }
 </style>
<![endif]-->

<script type="text/javascript">

//Verifica Campos preenchidos
function verForm(){
	
	if(document.form1.totalVenda.value == "R$ 0,00" || document.form1.totalVenda.value == "R$ 0.00" || document.form1.totalVenda.value == "R$ NaN"){
		alert("Impossivel Concluir!\nNenhum produto foi adicionado.");
		if(confirm("Adicionar Produtos AGORA?")){
			window.location.href = "sis_gerar_venda.jsp";
		}
		return false;
	}
	
	if(document.form1.pago.value == "" && document.form1.formID.value == "1"){
		alert("Informe o valor Recebido.");
		document.form1.pago.focus();
		return false;
	}
	
	if(document.form1.formID.value == "3" && document.form1.parcelas.value != "1"){
		alert("D�bito somente pode ser pago de uma vez (A vista)");
		document.form1.parcelas.focus();
		return false;
	}
	
}

//Fun��o para Mudar o Foco do campo e calcula o troco
function calculaTroco(){
	var total = document.form1.valorVariavel.value;
	var recebido = document.form1.pago.value;
	var forma = document.form1.formID.value;
	
	//Retira o ponto e substitui por virgula
	total = total.replace(",",".");
	recebido = recebido.replace(",",".");
	
	//Verifica se foi passado um valor no Recebido
	if(recebido != ""){
	
		//Atribui o valor a varial troco e coloca ela no campo <troco>
		var troco = (recebido - total);
		
		if(troco < 0 && forma == "1"){
			alert("O valor recebido\nDeve ser maior que o total da Venda!");
			document.form1.pago.value = "";
			document.form1.pago.focus();
			return false;	
		}
		
		if(forma == "1"){
			document.form1.troco.value = troco.toFixed(2);
			document.form1.troco.value = document.form1.troco.value.replace(".",",");
			
		}else{
			document.form1.troco.value = "";	
		}
	
	}
	
}

//Fun��o para Mudar o Foco do campo e calcula o troco
function calculaTrocoB(){
	var total = document.form1.valorVariavel.value;
	var recebido = document.form1.pago.value;
	
	//Retira o ponto e substitui por virgula
	total = total.replace(",",".");
	recebido = recebido.replace(",",".");
	
	
	//Atribui o valor a varial troco e coloca ela no campo <troco>
	var troco = (recebido - total);
	
	if(troco < 0){
		return false;	
	}
	
	if(forma == "1"){
	
		document.form1.troco.value = troco.toFixed(2);
		document.form1.troco.value = "R$ "+document.form1.troco.value.replace(".",",");
		
		document.form1.pago.focus();
	}else{
		document.form1.troco.value = "";	
	}
}

//Calcula o Desconto
function descontar(){
	var desconto = document.form1.desconto.value;
	var total = document.form1.totalDaVenda.value;
	
	desconto = desconto.replace(",",".");
	
	if(parseFloat(total) < parseFloat(desconto)){
		alert("Impossivel dar um Desconto\nque excede o valor Total!");
		document.form1.desconto.value = "0,00";
		document.form1.desconto.focus();
		return false;
	}
	
	var valorFinal = (total - desconto);
	
	
	document.form1.valorVariavel.value = valorFinal;
	document.form1.totalVenda.value = "R$ "+valorFinal.toFixed(2);
	document.form1.totalVenda.value = document.form1.totalVenda.value.replace(".",",");
	
}

//Verifica a forma de Pagamento e muda o Campo de Valor Recebido para Entrada
function trocaCampo(){
	if(document.form1.formID.value == "1"){
		document.getElementById("entrada").value = "Valor Recebido";
	}else{
		document.getElementById("entrada").value = "Entrada (R$)";
	}
}

//Valida se o Campo � Num�rico (COM V�RGULA " , " )
function numero()	{
if (event.keyCode<48 && event.keyCode!=44 || event.keyCode>57 && event.keyCode!=44){return false;} 
}

</script>

<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/geral.css" rel="stylesheet" type="text/css" />

<style type="text/css">
/*ESTILO PARA TELA PDV*/

.tituloPDV{
	font-family:Verdana, Geneva, sans-serif;
	color:#222222;
	font-size:14px;
	font-weight:bold;
	height:25px;
	vertical-align:middle;
}

.labelPDV{
	width:100px;
	height:25px;
	padding-left:2px;
	margin-left:5px;
	border:0px;
	font-family:"Courier New", Courier, monospace;
	font-size:16px;
}

.selectPDV{
	width:338px;
	height:30px;
	font-size:16px;
	font-family:"Courier New", Courier, monospace;
	padding-left:2px;
	margin-left:4px;
	border:0px;	
}

.parcelasPDV{
	width:102px;
	height:30px;
	font-size:16px;
	font-family:"Courier New", Courier, monospace;
	padding-left:2px;
	margin-left:4px;
	border:0px;	
}

.descricaoProdutoPDV{
	width:460px;
	height:25px;
	font-size:16px;
	font-family:"Courier New", Courier, monospace;
	padding-left:2px;
	margin-left:5px;
	border:0px;
}

.totalPDV{
	font-size:30px;
	font-family:Verdana, Geneva, sans-serif;
	color:#006633;
	font-weight:bold;
	width:320px;
	border:0px;
	background-color:#EEEEEE
}

#itensAdicionados{
	width:370px;
	height:228px;
	background-color:#000000;
	color:#FFF;
	font-family:"Courier New", Courier, monospace;
	font-size:12px;
	padding:4px;
	overflow:auto;
}

</style>

</head>


<body onload="javascript: document.form1.pago.focus();">

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">

<!--INICIO DO FORMUL�RIO DE VENDAS-->
 <form name="form1" method="post" action="sis_insert_manager_venda.jsp" id="form1" onSubmit="return verForm(this)">
   <table width="985" height="440" >
    <tr>
     <td height="20" colspan="2" align="center"><strong>PONTO DE VENDA - PDV</strong></td>
    </tr>
    <tr>
     <td valign="top">
    
    <table align="center" style="background-image:url(images/tela_concluir_pdv.png)" width="920" height="390" bgcolor="#FCFCFC">
     <tr>
      <!--Formul�rio-->
      <td valign="top" width="910">
      
 		<table align="center" width="860" cellpadding="0" cellspacing="0" border="0">
         <tr>
          <td colspan="4" align="left" class="tituloPDV">&nbsp;</td>
         </tr>
         <tr>
          <td width="365" align="left" class="tituloPDV">&nbsp;Formas de Pagamento</td>
          <td width="130" align="left" class="tituloPDV">&nbsp;Parcelas</td>
          <td colspan="2" align="left" class="tituloPDV">&nbsp;Cliente</td>
         </tr>
         <tr>
          <td align="left" valign="middle" background="images/label365.png">
            <select name="formID" class="selectPDV" onchange="trocaCampo()">
             <%while(rs01.next()){ %>
              <option value="<%=rs01.getString("formID") %>"><%=rs01.getString("descricao") %></option>
             <%} %>
            </select>
          </td>
          <td height="40" align="left" valign="middle" background="images/label130.png">
          	<select name="parcelas" class="parcelasPDV">
             <option value="1" selected="selected">A Vista</option>
             <option value="2">2 x</option>
             <option value="3">3 x</option>
             <option value="4">4 x</option>
             <option value="5">5 x</option>
             <option value="6">6 x</option>
             <option value="7">7 x</option>
             <option value="8">8 x</option>
             <option value="9">9 x</option>
             <option value="10">10 x</option>
             <option value="11">11 x</option>
             <option value="12">12 x</option>
             <option value="13">13 x</option>
             <option value="14">14 x</option>
             <option value="15">15 x</option>
             <option value="16">16 x</option>
             <option value="17">17 x</option>
             <option value="18">18 x</option>
            </select>
          </td>
          <td align="left" colspan="2" valign="middle" background="images/label365.png" style="background-repeat:no-repeat">
            <select name="clienteID" class="selectPDV">
             <option value="0" selected="selected">Selecione um Cliente...</option>
             <%while(rs02.next()){ %>
              <option value="<%=rs02.getString("clienteID") %>"><%=rs02.getString("clienteNomeFantasia") %></option>
             <%} %>
            </select>
          </td>
         </tr>
         <tr>
          <td colspan="4" class="tituloPDV"></td>
         </tr>
         <tr>
          <td></td>
          <td align="left" class="tituloPDV">&nbsp;Desconto</td>
          <td width="234" align="left" class="tituloPDV">&nbsp;<input type="text" id="entrada" style="font:Verdana, Geneva, sans-serif; font-size:14px; font-weight:bold; border:0px; background-color:#EEEEEE;" value="Valor Recebido" readonly="readonly" /></td>
          <td width="131" align="left" class="tituloPDV">&nbsp;Troco</td>
         </tr>
         <tr>
          <td height="40"></td>
          <td align="left" valign="middle" background="images/label130.png"><input name="desconto" type="text" class="labelPDV" onblur="descontar(); calculaTrocoB()" onKeyPress="return numero(this)" value="0,00" /></td>
          <td width="234" align="left" valign="middle" background="images/label235.png" style="background-repeat:no-repeat"><input class="labelPDV" type="text" name="pago" onKeyPress="return numero(this)" onblur="calculaTroco()"/></td>
          <td width="131" align="left" valign="middle" background="images/label235.png"><input name="troco" type="text" class="labelPDV" readonly="readonly" /></td>
         </tr>
         <tr>
          <td colspan="4" class="tituloPDV"></td>
         </tr>
         <tr>
          <td></td>
          <td></td>
          <td colspan="2" align="left" class="tituloPDV">Valor Total da Compra</td>
         </tr>
         <tr>
          <td></td>
          <td>
           <input type="hidden" name="totalDaVenda" value="<%=rs.getString("subtotal")%>" />
           <input type="hidden" name="valorVariavel" value="<%=rs.getString("subtotal")%>" />
           <input type="hidden" name="vendaID" value="<%=request.getParameter("vendaID")%>" />
          </td>
          <td colspan="2" height="50" align="left" class="totalPDV"><input name="totalVenda" type="text" class="totalPDV" value="<%=subTotal %>" readonly="readonly" /></td>
         </tr>
         <tr>
          <td></td>
          <td></td>
          <td colspan="2" align="left">---------------------------------------------------------------------------------------</td>
         </tr>
         <tr>
          <td></td>
          <td></td>
          <td align="right" colspan="2" height="50" valign="middle"><input type="submit" name="concluir" style="border:0px; background-image:url(images/concluirpdv.png); background-color:transparent; width:210px; height:55px;" value="" title="Concluir Venda" />
          </td> 
         </tr>
        </table>
          
      </td>
    </tr>
   </table>
   
  </td>
 </tr>
</table>
  </form>
  <!--FIM DO FORMUL�RIO-->

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