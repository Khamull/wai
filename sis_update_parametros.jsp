<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="parametro" class="cadastro.Parametros" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>


<%
//Pesquisa dados da tabela parametros
int porcentagem = 0;
parametro.codigoParametro = "1";
rs = st.executeQuery(parametro.pesquisaParametroPorCodigo());

if(rs.next()){
	porcentagem = rs.getInt("valorParametro");
}

%>


<%
//Trata mensagens
//variaveis que serao utilizadas para verificaçao
String msg = "";
int numeroMsg;
//verifica se foi passado alguma mensagem via URL
if(request.getParameter("msg") != null){
	numeroMsg = Integer.parseInt(request.getParameter("msg"));
	msg = parametro.mensagem(numeroMsg);
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2" />
<title>FORTE SYSTEM</title>

<script type="text/javascript">
function verForm(){
	
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


<script type="text/javascript">

//Valida se o Campo é Numérico
function numero()	{
if (event.keyCode<48 || event.keyCode>57){return false;} 
}


</script>

<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/geral.css" rel="stylesheet" type="text/css" />

</head>

<body onload="document.form1.valorParametro.focus()">

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="440">
<tr>
 <td height="25" bgcolor="#EEEEEE">
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_menu_servicos.jsp'" value="Menu Serviços" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_orcamento_servicos.jsp'" value="Lista de Orçamentos" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_contratos.jsp'" value="Lista de Contratos" />
 </td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">
 
 <form name="form1" method="post" action="sis_update_manager_parametros.jsp">
 <table align="center" cellpadding="2" cellspacing="2">
  <tr bgcolor="#EEEEEE">
   <td colspan="3" align="center"><strong>PARAMETROS DO SISTEMA</strong></td>
  </tr>
  <tr>
   <td colspan="3" align="center"><font color="#ff0000"><strong><%=msg %></strong></font></td>
  </tr>
  <tr>
   <td colspan="3" height="20"></td>
  </tr>
  <tr>
   <td width="159" align="left">Porcentagem de Entrada</td>
   <td width="158" align="left">
    <input type="text" name="valorParametro" value="<%=porcentagem%>" maxlength="3" onkeypress="return numero(this)" />
    %
    <input type="hidden" name="codigoParametro" value="1" />
   </td>
   <td width="67" align="left"><input type="submit" name="SALVAR" value="Alterar" /></td>
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