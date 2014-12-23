<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

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
servico.empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
//Pesquisa todos os Servi�os cadastrados no sistema ou por Cliente
if(request.getParameter("nome") != null){
	rs = st.executeQuery(servico.pesquisaPorCliente(request.getParameter("nome")));
}else{
	rs = st.executeQuery(servico.listaServicosPendentes());
}
%>


<%
//Trata mensagens
//variaveis que ser�o utilizadas para verifica��o
String msg = "";
int numeroMsg;
//verifica se foi passado alguma mensagem via URL
if(request.getParameter("msg") != null){
	numeroMsg = Integer.parseInt(request.getParameter("msg"));
	msg = servico.mensagem(numeroMsg);
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
function verForm(){
	
}
</script>

<script type="text/javascript">

function confirma(servicoID){
	if(confirm("Deseja Confirmar a visualiza�ao desse Servi�o?")){
		window.location.href="sis_manager_confirmar_visualizacao.jsp?servicoID="+servicoID;
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
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_menu_servicos.jsp'" value="Menu Servi�os" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_orcamento_servico.jsp'" value="+ Novo Or�amento" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_contratos.jsp'" value="Lista de Contratos" />
 &nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_servicos_fechados.jsp'" value="Servi�os Fechados" />
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
    <td colspan="8" align="center"><strong>OR&Ccedil;AMENTOS</strong></td>
   </tr>
   <tr>
     <td colspan="8" height="15"></td>
   </tr>
   <tr>
    <td colspan="8" height="40" align="left" valign="middle">
    
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
    <td width="100" align="left"><strong>N&deg; Or&ccedil;amento</strong></td>
    <td width="270" align="left"><strong>Cliente</strong></td>
    <td width="100" align="center"><strong>Data de Inicio</strong></td>
    <td width="100" align="center"><strong>Valor</strong></td>
    <td width="60" align="center"><strong>Ed</strong></td>
    <td width="60" align="center"><strong>Vs</strong></td>
    <td width="60" align="center"><strong></strong></td>
    <td width="60" align="center">
    </td>
   </tr>
   <tr>
    <td colspan="8">
     <table id="tb1" width="810" align="center" cellpadding="0" cellspacing="0">  
      <tr>
       <td colspan="8" height="5"></td>
      </tr> 
<%
//Enquanto a Consulta retonar um resultada, Liste os Usu�rios do Sistema
while (rs.next()){
%>


<%
//forma o numero do or�amento
String orc = rs.getString("orcamento");
String ano = rs.getString("dataInicio");

String numOrcamento = orc+"/"+ano.substring(0,4);
%>
   
   <tr>
    <td height="30" width="100" align="left"><%=numOrcamento %></td>
    <td height="30" width="270" align="left"><a href="sis_endereco_obra.jsp?servicoID=<%=rs.getString("servicoID")%>" title="Endere�o da Obra"><%=rs.getString("clienteNomeFantasia") %></a></td>
    <td height="30" width="100" align="center"><%=data.converteDeData(rs.getString("dataInicio")) %></td>
    <td height="30" width="100" align="center"><%=formato.format(rs.getDouble("valor")) %></td>
    <td height="30" width="60" align="center"><a href="sis_update_servico.jsp?servicoID=<%=rs.getString("servicoID")%>&orcamento=s"><img src="ico/ico_editar.png" width="20" height="20" border="0" title="Editar Servi�o" /></a></td>
    <td height="30" width="60" align="center">
    <a href="sis_detalhe_servico.jsp?servicoID=<%=rs.getString("servicoID")%>"><img src="ico/ico_visualizar.png" width="20" height="20" border="0" title="Visualizar Detalhes do Servi�o" /> </a></td>    
    <td height="30" width="60" align="center"><a href="sis_print_orcamento.jsp?servicoID=<%=rs.getString("servicoID")%>"><img src="ico/ico_print.png" width="20" height="20" title="Imprimir" /></a></td>
    <td height="30" width="60" align="center"></td>
   </tr>
   <tr>
    <td colspan="8" align="center" style="height:1px"><hr style="border:1px solid #333333" /></td>
   </tr>

<%
}
%>
   </table>
   </td>
   </tr>
	
	<tr>
	 <td colspan="8" align="center"><font color="#ff0000"><%=msg %></font></td>
	</tr>
    <tr>
     <td colspan="8" align="center">
      <!-- div onde ser� criados os links da pagina�ao -->
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
        var pager = new Pager('tb1', 12); 
        pager.init(); 
        pager.showPageNav('pager', 'pageNav'); 
        pager.showPage(1);
    </script>

</body>
</html>