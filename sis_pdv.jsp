<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<%@ include file="inc/conexao.jsp" %>
<%@ include file="inc/seguranca.jsp" %>

<jsp:useBean id="produto" class="cadastro.Produto" scope="page"></jsp:useBean>

<jsp:useBean id="itens" class="pdv.VendaItem" scope="page"></jsp:useBean>

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
//Pesquisa produtos
rs = st.executeQuery(produto.listaProdutosAtivos());

//Pesquisa itens relacionados ao ID dessa Venda
//Atribui o ID da venda Objeto
if(request.getParameter("vendaID") != null){
	itens.venda.vendaID = Integer.parseInt(request.getParameter("vendaID"));
	rs01 = st01.executeQuery(itens.listaItensPorID());
}else{
	response.sendRedirect("sis_menu.jsp");
}
%>


<%
//Pesquisa dados do produto produto por C�digo
//verifica se foi passado um parametro de busca via URL
if(request.getParameter("buscar") != null){
	//verifica se foi passado um codigo
	if(request.getParameter("codigo") != null){
		//Realiza a busca por C�digo de Produto
		rs02 = st02.executeQuery(produto.pesquisaProdutoPorCodigo(request.getParameter("codigo")));
	}
}

%>


<%
//Variaveis de Descri��o do Produto
String produtoID = "";
float estoque = 1;
int minimo = 0;
String descricao = "";
String precoUnitario = "0.00";
String totalItem = "0.00";

//Atribui valores da tabela produto �s variaveis

if(request.getParameter("codigo") != null){
	if(rs02.next()){
		produtoID = rs02.getString("produtoID");
		estoque = Float.parseFloat(rs02.getString("estoque"));
		minimo = Integer.parseInt(rs02.getString("estoqueMinimo"));
		descricao = rs02.getString("codigo")+" - "+rs02.getString("tipo")+" "+rs02.getString("nome");
		precoUnitario = rs02.getString("preco");
		totalItem = rs02.getString("preco");
	}
}

%>

<%
//Pesquisa o Subtotal da Venda
rs03 = st03.executeQuery(itens.totalItem());
//Verifica se retornou algum resultado e atribui a uma variavel

String subTotal = "0";
if(rs03.next()){
		
	if(rs03.getDouble("subtotal")!=0){
		Currency currency = Currency.getInstance("BRL");
		
		DecimalFormat formato1 = new DecimalFormat("R$ #,##0.00");
		
		subTotal = formato1.format(rs03.getDouble("subtotal"));
	}
}
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
	
	if(document.form1.prodID.value == ""){
		alert("Esse Produto n�o est� Cadastrado no Sistema!\nFavor Selecione um produto existente.");
		document.form1.codigo.focus();
		return false;
	}
	
	if(document.form1.qtddEstoque.value <= 0){
		alert("Este produto est� indisponivel em Estoque!");
		document.form1.codigo.focus();
		return false;
	}
	
	if(parseFloat(document.form1.qtddEstoque.value) < parseFloat(document.form1.quantidade.value)){
		alert("Quantidade indisponivel em Estoque!\nDISPONIVEL: "+document.form1.qtddEstoque.value);
		document.form1.quantidade.focus();
		return false;
	}
	
	if(document.form1.descricao.value == ""){
		alert("Favor informe a Descri��o do Produto!");
		document.form1.descricao.focus();
		return false;		
	}
	
}

//Avisa que antes de Excluir a venda � necess�rio Excluir os produtos adicionados a ela
function impossivelExcluir(){
	alert("Para Excluir essa venda � necess�rio\nRemover os produtos adicionados!");
}

//Exclui a Venda
function excluirVenda(vendaID){
	if(confirm("Tem Certeza que deseja CANCELAR essa Venda?")){
		window.location.href="sis_delete_manager_venda.jsp?vendaID="+vendaID;
	}
}

//Exclui o Item Selecionado
function excluiItem(itemID){
	if(confirm("Tem Certeza que deseja Excluir esse Item?")){
		window.location.href="sis_delete_manager_item.jsp?itemID="+itemID;
	}
}

//Valida se o Campo � Num�rico
function numero()	{
if (event.keyCode<48 || event.keyCode>57){return false;} 
}


//Pesquisa produto Atrav�s do Codigo
function pesquisaProduto(){
	
	var prod = document.form1.produtoID.value;
	var cod = document.form1.codigo.value;
	var venID = document.form1.vendaID.value;
	
	if(document.form1.codigo.value == "" && document.form1.produtoID.value == ""){
		return false;
	}else if(document.form1.codigo.value != "" && document.form1.produtoID.value == ""){
		//alert("por codigo");
		window.location.href = "sis_pdv.jsp?buscar=ok&codigo="+cod+"&vendaID="+venID;
	}else if(document.form1.codigo.value == "" && document.form1.produtoID.value != ""){
		//alert("por nome");
		window.location.href = "sis_pdv.jsp?buscar=ok&codigo="+prod+"&vendaID="+venID;
	}
	
}

//Verifica o Andamento da venda e determina o foco
function verFoco(){
	if(document.form1.descricao.value == ""){
		document.form1.codigo.focus();
	}else if(document.form1.descricao.value != ""){
		document.form1.quantidade.focus();
	}
}

//Verifca se tem "," ao inv�s de "." e Substitui
function verPonto(){
	var valorUnitario = document.form1.valorUnitario.value;
	var qtdd = document.form1.quantidade.value;
	var totalItem = document.form1.totalItem.value;
	
	
	valorUnitario = valorUnitario.replace(",",".");
	qtdd = qtdd.replace(",",".");
	totalItem = totalItem.replace(",",".");
	
	document.form1.valorUnitario.value = valorUnitario;
	document.form1.quantidade.value = qtdd;
	document.form1.totalItem.value = totalItem;
}

//Calcula o Total por Item
function calculaTotal(){
	
	var valorUnitario = document.form1.valorUnitario.value;
	var qtdd = document.form1.quantidade.value;
	
	
	valorUnitario = valorUnitario.replace(",",".");
	qtdd = qtdd.replace(",",".");
	
	//alert("valor Unitario "+ valorUnitario);
	//alert("quantidade "+ qtdd);
	
	var x = (valorUnitario * qtdd);
	document.form1.totalItem.value = x.toFixed(2);	
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
	font-size:16px;
	font-family:"Courier New", Courier, monospace;
	color:#FFFFFF;
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


<body onload="javascript: verFoco()">

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">

<!--INICIO DO FORMUL�RIO DE VENDAS-->
 <form name="form1" method="post" action="sis_insert_manager_item.jsp" id="form1" onSubmit="return verForm(this)">
   <table width="985" height="440">
    <tr>
     <td height="20" colspan="2" align="center" valign="middle">
     <font size="5">
     <strong>PONTO DE VENDA - PDV 
     <%if(subTotal.equals("0")){%>
     <font color="#009900">( CAIXA LIVRE )</font>
     <%}else{ %>
     <font color="#FF0000">( CAIXA EM USO )</font>
     <%} %>
     </strong>
     </font>
     </td>
    </tr>
    <tr>
     <td valign="top">
    
    <table align="center" style="background-image:url(images/tela_pdv.png)" width="920" height="390" bgcolor="#FCFCFC">
     <tr>
      <!--Primeira Coluna-->
      <td width="528" valign="top">
      
      <table width="495" border="0" align="center" cellpadding="0" cellspacing="0">
       <tr>
         <td height="10" align="left">&nbsp;</td>
         <td colspan="2" align="left" class="tituloPDV">&nbsp;</td>
       </tr>
       <tr>
        <td width="130" align="left" class="tituloPDV">&nbsp;C&oacute;digo</td>
        <td colspan="2" align="left" class="tituloPDV">&nbsp;Produto</td>
       </tr>
       <tr>
        <td height="40" align="left" valign="middle" background="images/label130.png"><input class="labelPDV" type="text" name="codigo" onblur="pesquisaProduto()" /></td>
        <td align="left" colspan="2" valign="middle" background="images/label365.png">
        <select name="produtoID" class="selectPDV" onblur="pesquisaProduto()">
         <option value="" selected="selected">Selecione um Produto...</option>
         <%while(rs.next()){ %>
          <option value="<%=rs.getString("codigo") %>"><%=rs.getString("tipo") %> - <%=rs.getString("nome") %></option>
         <%} %>
        </select>
        </td>
       </tr>
       <tr>
        <td align="left" class="tituloPDV">
        &nbsp;Descri&ccedil;&atilde;o 
        <input type="hidden" name="prodID" value="<%=produtoID%>" />
        <input type="hidden" name="vendaID" value="<%=request.getParameter("vendaID")%>" />
        </td>
        <td width="235"><input type="hidden" name="qtddEstoque" value="<%=estoque%>" /></td>
        <td width="130"></td>
       </tr>
       <tr>
        <td align="left" colspan="3" height="40" background="images/label495.png"><input name="descricao" type="text" class="descricaoProdutoPDV"  value="<%=descricao%>"/></td>
       </tr>
       <%if (estoque <= 0){%>
       <tr>
        <td align="center" colspan="3" background="images/estoquezero.png"><font color="#FFFFFF"><strong>PRODUTO INDISPON&Iacute;VEL EM ESTOQUE</strong></font></td>
       </tr>
       <%}else if(estoque < minimo){%>
       <tr>
        <td align="center" colspan="3" background="images/estoqueacabando.png"><font color="#FF0000"><strong>ESSE PRODUTO EST&Aacute; COM O ESTOQUE ABAIXO DO M&Iacute;NIMO</strong></font></td>
       </tr>
       <%}%>
       <tr>
        <td align="left" class="tituloPDV">&nbsp;Quantidade</td>
        <td align="left" class="tituloPDV">&nbsp;Valor Unit&aacute;rio</td>
        <td align="left" class="tituloPDV">&nbsp;Total Item</td>
       </tr>
       <tr>
        <td align="left" height="40" background="images/label130.png"><input type="text" name="quantidade" class="labelPDV" value="1" onblur="calculaTotal(); verPonto()" /></td>
        <td align="left" height="40" background="images/label235.png"><input type="text" name="valorUnitario" class="labelPDV" value="<%=precoUnitario%>" onblur="calculaTotal(); verPonto()" /></td>
        <td align="left" height="40" background="images/label130.png"><input type="text" name="totalItem" class="labelPDV" value="<%=totalItem%>" onblur="verPonto()"/></td>
       </tr>
       <tr>
        <td height="70" valign="middle" colspan="3" background="images/totalCompra.png" class="totalPDV">&nbsp;&nbsp;TOTAL DO CUPOM: <strong><%=subTotal%></strong></td>
       </tr>
       <tr>
        <td height="70" valign="middle" colspan="3"><input type="submit" name="CADASTRAR" onclick="calculaTotal()" style="border:0px; background-color:#EEEEEE; width:204px; height:58px; background-image:url(images/submitpdv.png)" value="" title="Cadastrar Item" /></td>
       </tr>
      </table>
      
      </td>
      <!--Segunda Coluna-->
      <td width="380" valign="top">
      
      <table height="305" border="0" align="left" cellpadding="0" cellspacing="0">
       <tr>
        <td valign="bottom"><font face="Verdana, Geneva, sans-serif"><br />
          ITENS DA COMPRA</font> N&deg;: <%=request.getParameter("vendaID")%><br />
        <br />
	<div id="itensAdicionados">
  		
        <table align="center" width="348" cellpadding="0" cellspacing="0">
        
        <%while(rs01.next()){%>
        
			<%
            String preco = null;
			String total = null;
            
			Currency currency = Currency.getInstance("BRL");
            
            DecimalFormat formato = new DecimalFormat("R$ #,##0.00");
            
            preco = formato.format(rs01.getDouble("valor"));
			total = formato.format(rs01.getDouble("total"));
            %>

         <tr>
          <td width="49" align="left"><%=rs01.getString("codigo")%></td>
          <td colspan="3" align="left"><%=rs01.getString("tipo")%> <%=rs01.getString("nome")%></td>
          <td width="10" align="left">&nbsp;</td>
          <td width="11" align="right"><a href="javascript: excluiItem(<%=rs01.getString("itemID")%>)" style="color:#FFFFFF" title="Remover Produto">[x]</a></td>
         </tr>
         <tr>
          <td align="left"></td>
          <td width="178" align="left"><%=preco%> / qtd: <%=rs01.getString("quantidade")%></td>
          <td colspan="4" align="left">total <%=total%></td>
         </tr>
         <tr>
          <td colspan="6">-------------------------------------------------</td>
         </tr>
        <%}%>
         
        </table>        
        
    </div>
        
        </td>
       </tr>
       <td align="right" height="14">
       </td>
       <tr>
         <td align="right" height="70"><img src="images/pagarpdv.png" border="0" usemap="#Map" /></td>
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
<map name="Map" id="Map">
  <area shape="rect" coords="181,9,377,58" href="sis_fechar_venda.jsp?vendaID=<%=request.getParameter("vendaID")%>" title="Pagar e Concluir" />
  <%if(subTotal == "0"){%>
   <area shape="rect" coords="7,14,43,50" href="javascript: excluirVenda(<%=request.getParameter("vendaID")%>);" title="Cancelar Venda" />
  <%}else{%>
   <area shape="rect" coords="7,14,43,50" href="javascript: impossivelExcluir()" title="Cancelar Venda" />
  <%}%>
</map>
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