<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>


<jsp:useBean id="contrato" class="servico.Contrato"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>

<%
//Atribui o ID do contrato ao objeto
contrato.contratoID = 1;
%>


<%
//Pesquisa informações sobre o contrato
rs = st.executeQuery(contrato.textoContrato());
	//Verifica se a consulta trouxe algum resultado
	if(rs.next()){
		contrato.contratoTexto = rs.getString("contratoTexto");
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
	msg = contrato.mensagem(numeroMsg);
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

<script src="js/nicEdit.js" type="text/javascript"></script>
<script type="text/javascript">
	bkLib.onDomLoaded(function() {
	new nicEditor({maxHeight : 250}).panelInstance('area5');
});
</script>

<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/geral.css" rel="stylesheet" type="text/css" />

</head>

<body>

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="440">
<tr>
 <td height="25" bgcolor="#EEEEEE">
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_menu_servicos.jsp'" value="Menu Serviços" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_orcamento_servico.jsp'" value="+ Novo Orçamento" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_orcamento_servicos.jsp'" value="Lista de Orçamentos" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_contratos.jsp'" value="Lista de Contratos" />
 &nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_servicos_fechados.jsp'" value="Serviços Fechados" />
 </td>
</tr>
<tr>
 <td height="25" align="center"><strong><font color="#FF0000"><%=msg %></font></strong></td>
</tr>
<tr>
 <td valign="top" align="center">
 <form name="form1" method="post" action="sis_update_manager_modelo_contrato.jsp">
 <table align="center" cellpadding="4" cellspacing="4" style="border:1px solid #444444; width:610px">
  <tr bgcolor="#EEEEEE">
   <td align="center"><strong>ATUALIZA&Ccedil;&Atilde;O DE CONTRATO</strong>
   <input type="hidden" name="contratoID" value="<%=contrato.contratoID %>">
   </td>
  </tr>
  <tr>
   <td align="left"><textarea name="contratoTexto" style="width:600px; height:220px" id="area5"><%=contrato.contratoTexto %></textarea></td>
  </tr>
  <tr>
   <td align="left"><input type="submit" class="botao" name="ATUALIZAR" value="Alterar" /></td>
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