<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="servicos" class="servico.Servicos" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>

<%
//Recupera o ID do servico passado via URL e faz a pesquisa
servicos.servicoID = Integer.parseInt(request.getParameter("servicoID"));

rs = st.executeQuery(servicos.servicoPorID());
%>


<%
//Trata mensagens
//variaveis que serão utilizadas para verificação
String msg = "";
int numeroMsg;
//verifica se foi passado alguma mensagem via URL
if(request.getParameter("msg") != null){
	numeroMsg = Integer.parseInt(request.getParameter("msg"));
	msg = servicos.mensagem(numeroMsg);
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2" />
<title>FORTE SYSTEM</title>

<script type="text/javascript">
function verForm(){

	if(document.form1.servicoTitulo.value == ""){
		alert("Informe o titulo do serviço!");
		document.form1.servicoTitulo.focus();
		return false;
	}
	
	if(document.form1.tipo.value == ""){
		alert("Escolha a Forma que esse serviço será cobrado!");
		document.form1.tipo.focus();
		return false;
	}
	
	if(document.form1.tipo.value == "M" && document.form1.valorM.value == "0,00"){
		alert("Informe o valor a ser Pago por m2!");
		document.form1.valorM.focus();
		return false;
	}
	
	if(document.form1.tipo.value == "P" && document.form1.valorP.value == "0"){
		alert("Informe o valor a ser Pago em Porcentagem(%)");
		document.form1.valorP.focus();
		return false;
	}
	
	
	var valM = document.form1.valorM.value;
	document.form1.valorM.value = valM.replace(",",".");
	
	
}



//Muda alguns Campos de acordo com o Tipo de Serviços Escolhido
function verTipo(){

	var tipo = document.form1.tipo.value;
	
	if(tipo == "P"){
		//alert("Cadastro de Serviço por porcentagem!");
		document.getElementById('porcent').style.display = 'inline';
		document.getElementById('metroQuad').style.display = 'none';
		document.getElementById('porcentInput').style.display = 'inline';
		document.getElementById('metroQuadInput').style.display = 'none';
		document.form1.valorM.value = "0,00";
		document.form1.valorP.focus();
	}else if(tipo == "M"){
		//alert("Cadastro de Serviço por metro quadrado!");
		document.getElementById('porcent').style.display = 'none';
		document.getElementById('metroQuad').style.display = 'inline';
		document.getElementById('porcentInput').style.display = 'none';
		document.getElementById('metroQuadInput').style.display = 'inline';
		document.form1.valorP.value = "0";
		document.form1.valorM.focus();
	}else if(tipo == "V"){
		//alert("Cadastro de Serviço VB por metro quadrado!");
		document.getElementById('porcent').style.display = 'none';
		document.getElementById('metroQuad').style.display = 'inline';
		document.getElementById('porcentInput').style.display = 'none';
		document.getElementById('metroQuadInput').style.display = 'inline';
		document.form1.valorP.value = "0";
		document.form1.valorM.focus();
	}else{
		document.getElementById('porcent').style.display = 'none';
		document.getElementById('metroQuad').style.display = 'none';
		document.getElementById('porcentInput').style.display = 'none';
		document.getElementById('metroQuadInput').style.display = 'none';
		document.form1.valorP.value = "0";
		document.form1.valorM.focus();
	}
	
}


//Muda alguns Campos de acordo com o Tipo de Serviço
function verTipo2(){

	var tipo = document.form1.tipo.value;
	
	if(tipo == "P"){
		document.getElementById('porcent').style.display = 'inline';
		document.getElementById('metroQuad').style.display = 'none';
		document.getElementById('porcentInput').style.display = 'inline';
		document.getElementById('metroQuadInput').style.display = 'none';
	}else if(tipo == "M"){
		document.getElementById('porcent').style.display = 'none';
		document.getElementById('metroQuad').style.display = 'inline';
		document.getElementById('porcentInput').style.display = 'none';
		document.getElementById('metroQuadInput').style.display = 'inline';
	}else if(tipo == "V"){
		document.getElementById('porcent').style.display = 'none';
		document.getElementById('metroQuad').style.display = 'inline';
		document.getElementById('porcentInput').style.display = 'none';
		document.getElementById('metroQuadInput').style.display = 'inline';
	}
	
}


//Valida se o Campo é Numérico
function numero()	{
if (event.keyCode<48 || event.keyCode>57){return false;} 
}

//Valida se o Campo é Numérico (COM VÍRGULA " , " )
function numeroVirgula()	{
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

<body onload="document.form1.VOLTAR.focus(); verTipo2();">

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">

<%
//Verifica se a consulta trouxe algum resultado
if(rs.next()){
%>

<table width="985" align="center" height="440">
<tr>
 <td height="25" bgcolor="#EEEEEE">
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_menu_servicos.jsp'" value="Menu Serviços" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_servicos.jsp'" value="Lista Serviços" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_orcamento_servico.jsp'" value="+ Novo Orçamento" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_servico.jsp'" value="+ Novo Serviço" />
 </td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">
 <br />
 <form name="form1" method="Post" action="sis_update_manager_servico.jsp" onsubmit="return verForm(this)">
 <table width="468" border="0" align="center" cellpadding="2" cellspacing="2"  style="border:1px solid #444444">
  <tr bgcolor="#EEEEEE">
   <td colspan="2" align="center"><strong>VISUALIZA&Ccedil;&Atilde;O DE SERVI&Ccedil;O</strong></td>
  </tr>
  <tr>
   <td width="154" align="left">Titulo do Servi&ccedil;o <input type="hidden" name="servicoID" value="<%=rs.getString("servicoID") %>"></td>
   <td width="298" align="left"><input name="servicoTitulo" type="text" size="50" maxlength="50" value="<%=rs.getString("servicoTitulo") %>" readonly="readonly" /></td>
  </tr>
  <tr>
   <td align="left">Unidade de Medida</td>
   <td align="left">
   <select name="tipo" onchange="verTipo()">
    <%if(rs.getString("tipo").equals("M")){ %>
    	<option value="M">m2 (metro quadrado)</option>
    <%}else if(rs.getString("tipo").equals("P")){ %>
    	<option value="P">% (porcentagem)</option>
    <%}else if(rs.getString("tipo").equals("V")){ %>
    	<option value="V">VB</option>
    <%} %>
   </select>
   </td>
  </tr>
  <tr>
   <td align="left"><div id="porcent" style="display:none">Porcentagem</div><div id="metroQuad" style="display:none">Valor do  m&sup2;</div></td>
   <td align="left">
   <div id="porcentInput" style="display:none"><input type="text" name="valorP" maxlength="10" value="<%=rs.getString("valorP") %>" onkeypress="return numero(this)" readonly="readonly" /></div>
   <div id="metroQuadInput" style="display:none"><input type="text" name="valorM" maxlength="10" value="<%=rs.getString("valorM").replace(".",",") %>" onkeypress="return numeroVirgula(this)" readonly="readonly" /></div>
   </td>
  </tr>
  <tr>
   <td align="left" colspan="2"><input name="VOLTAR" onclick="javascript: window.location.href='sis_view_servicos.jsp'" type="button" class="botao" value="&lt;&lt; Voltar" /></td>
  </tr>
 </table>
 </form>
 </td>
</tr>
</table>

<%} %>

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