<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>

<jsp:useBean id="servicos" class="servico.Servicos" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement para ajudar query
Statement st01 = con.createStatement();
%>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
ResultSet rs01 = null;
%>


<%
//Pesquisa todos os serviços
rs = st.executeQuery(servicos.listaTodosServicos());
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


<%
//Converte para o Formato Data
Currency currency = Currency.getInstance("BRL");

DecimalFormat formato = new DecimalFormat("R$ #,##0.00");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.Currency"%>
<%@page import="java.text.DecimalFormat"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2" />
<title>FORTE SYSTEM</title>



<script type="text/javascript">

//chama a página q vai excluir esse serviço
function excluir(servicoID){
	if(confirm("Tem certeza que deseja Excluir esse Serviço?")){
		window.location.href="sis_delete_mananger_servicos.jsp?servicoID="+servicoID;
	}
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

<link type="text/css" href="css/paging.css" rel="stylesheet" />	
<script type="text/javascript" src="js/paging.js"></script>

<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/geral.css" rel="stylesheet" type="text/css" /></head>

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
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_servico.jsp'" value="+ Novo Serviço" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_orcamento_servico.jsp'" value="+ Novo Orçamento" />
 </td>
</tr>
<tr>
 <td height="25" align="center">&nbsp;</td>
</tr>
<tr>
 <td valign="top" align="center">
 <br />
 <table width="810" align="center" cellpadding="0" cellspacing="0">
   <tr>
    <td colspan="7" align="center"><strong>LISTA DE SERVI&Ccedil;OS</strong></td>
   </tr>
   <tr>
     <td colspan="7" height="15"></td>
   </tr>
   <tr bgcolor="#EEEEEE">
    <td width="70" align="left"><strong>N&deg;</strong></td>
    <td width="360" align="left"><strong>Descri&ccedil;&atilde;o do Servi&ccedil;o</strong></td>
    <td width="100" align="center"><strong>Valor m&sup2;</strong></td>
    <td width="100" align="center"><strong>Valor (%)</strong></td>
    <td width="60" align="center"><strong>Ed</strong></td>
    <td width="60" align="center"><strong>Vs</strong></td>
    <td width="60" align="center"><strong>Ex</strong></td>
   </tr>
   <tr>
    <td colspan="8">
     <table id="tb1" width="810" align="center" cellpadding="0" cellspacing="0">  
      <tr>
       <td colspan="8" height="5"></td>
      </tr> 
  <%while(rs.next()){ %>
   <tr>
    <td height="30" width="70" align="left"><%=rs.getString("servicoID") %></td>
    <td height="30" width="360" align="left"><%=rs.getString("servicoTitulo") %></td>
    <td height="30" width="100" align="center">
    <%if(rs.getString("valorM").equals("0.00")){ %>
     - -
    <%}else{ %>
     <%=formato.format(rs.getDouble("valorM")) %>
    <%} %>
    </td>
    <td height="30" width="100" align="center">
    <%if(rs.getString("valorP").equals("0")){ %>
     - -
    <%}else{ %>
     <%=rs.getString("valorP") %> %
    <%} %>
    </td>
    <td height="30" width="60" align="center"><a href="sis_update_servicos.jsp?servicoID=<%=rs.getString("servicoID") %>"><img src="ico/ico_editar.png" width="20" height="20" border="0" title="Editar <%=rs.getString("servicoTitulo") %>" /></a></td>
    <td height="30" width="60" align="center"><a href="sis_detalhe_servicos.jsp?servicoID=<%=rs.getString("servicoID") %>"><img src="ico/ico_visualizar.png" width="20" height="20" border="0" title="Visualizar Detalhes de <%=rs.getString("servicoTitulo") %>" /></a></td>
    <td height="30" width="60" align="center"><a href="javascript: excluir(<%=rs.getString("servicoID") %>)"><img src="ico/ico_excluir.png" width="20" height="20" border="0" title="Excluir <%=rs.getString("servicoTitulo") %>"></a></td>
   </tr>
   <tr>
    <td colspan="7" align="center" style="height:1px"><hr style="border:1px solid #333333" /></td>
   </tr>
  <%} %>

   </table>   </td>
   </tr>
	
	<tr>
	 <td colspan="7" align="center"><font color="#ff0000"><%=msg %></font></td>
	</tr>
    <tr>
     <td colspan="7" align="center"></td>
    </tr>
  </table>
 
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