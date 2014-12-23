<%//@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="download" class="servico.Download" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>


<%
//Lista todos os arquivos disponiveis para download ou filtra por cliente
if(request.getParameter("nome") != null){
	rs = st.executeQuery(download.pesquisaPorCliente(request.getParameter("nome")));
}else{
	rs = st.executeQuery(download.pesquisaDownload());
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

<link type="text/css" href="css/paging.css" rel="stylesheet" />	
<script type="text/javascript" src="js/paging.js"></script>

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
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_upload_arquivos.jsp'" value="Upload de Arquivos" />
 </td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">
 
 <table width="800" align="center" cellpadding="0" cellspacing="0">
  <tr bgcolor="#EEEEEE">
    <td height="35" colspan="6" align="center" valign="top" bgcolor="#FFFFFF"><strong>LISTA DE ARQUIVOS PARA DOWNLOAD</strong></td>
    </tr>
  <tr bgcolor="#EEEEEE">
    <td colspan="6" align="left" bgcolor="#FFFFFF">
    
    <form name="formBusca" method="post">
     <table width="335" style="border:1px solid #333; height:30px" align="left" cellpadding="0" cellspacing="0">
      <tr>
       <td width="259" align="right">
       <input type="text" name="nome" maxlength="100" size="50" style="background-image:url(images/busca.png); height:18px; border:none"  onclick="this.style.backgroundImage = 'none'" onblur="if(this.value == '')this.style.backgroundImage = 'url(images/busca.png)'"/>
       </td>
       <td width="74" align="left"><input type="submit" class="botao" style="height:22px" name="BUSCAR" value="Buscar" /></td>
      </tr>
     </table>
    </form>
    
    </td>
    </tr>
  <tr bgcolor="#EEEEEE">
   <td width="210" align="left"><strong>Titulo</strong></td>
   <td width="115" align="left"><strong>N&deg; Contrato</strong></td>
   <td width="115" align="left"><strong>Arquivo</strong></td>
   <td width="210" align="left"><strong>Cliente</strong></td>
   <td width="100" align="left"><strong>Data</strong></td>
   <td width="60" align="center"></td>
  </tr>
  <tr>
  <td colspan="6">
  
  <table id="tb1" width="810" align="center" cellpadding="0" cellspacing="0">
   <tr>
     <td colspan="8" height="5"></td>
   </tr> 
  <%while(rs.next()){ %>
  <tr>
   <td width="209" height="25" align="left"><%=rs.getString("titulo") %></td>
   <td width="114" align="left"><%=rs.getString("contrato") %></td>
   <td width="115" align="left"><a href="download/<%=rs.getString("arquivo")%>" target="_blank" title="Download desse arquivo"><%=rs.getString("arquivo") %></a></td>
   <td width="210" align="left"><%=rs.getString("clienteNomeFantasia") %></td>
   <td width="100" align="left"><%=data.converteDeData(String.valueOf(rs.getDate("data"))) %></td>
   <td width="60" align="center"><a href="download/<%=rs.getString("arquivo")%>" target="_blank"><img src="ico/ico_baixa.png" width="20" height="20" border="0" title="Download desse arquivo" /></a></td>
  </tr>
  <tr>
   <td align="center" colspan="6"><hr style="border:1px solid #333333" /></td>
  </tr>
  <%} %>
  <tr>
   <td colspan="6" align="center"></td>
  </tr>
  </table>
  
  </td>
  </tr>
  <tr>
   <td align="center" colspan="6">
   	  <!-- div onde será criados os links da paginaçao -->
	  <div id="pageNav"></div>   
   </td>
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

	<script>
        var pager = new Pager('tb1', 10); 
        pager.init(); 
        pager.showPageNav('pager', 'pageNav'); 
        pager.showPage(1);
    </script>

</body>
</html>