<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<%@ include file="inc/seguranca.jsp" %>

<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="produto" class="cadastro.Produto" scope="page"></jsp:useBean>


<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>

<%
//Recupera o Nivel do Usu�rio
String nivel = String.valueOf(session.getAttribute("nivel"));
%>

<%
//Trata A��es
//variaveis que ser�o utilizadas para verifica��o
String acao = "";
int numeroAcao;
//verifica se passado alguma acao via URL
if(request.getParameter("acao") != null){
	produto.produtoID = Integer.parseInt(request.getParameter("produtoID"));
	numeroAcao = Integer.parseInt(request.getParameter("acao"));
	st.execute(produto.statusProduto(numeroAcao));
	response.sendRedirect("sis_view_produtos.jsp");
}
%>

<%
//Pesquisa Todos os Fornecedores ou busca por nome
if(request.getParameter("nome") != null){
	rs = st.executeQuery(produto.pesquisaProdutos(request.getParameter("nome")));
}else if(request.getParameter("codigo") != null){
	rs = st.executeQuery(produto.pesquisaProdutoPorCodigo(request.getParameter("codigo")));
}else{
	rs = st.executeQuery(produto.listaProdutos());
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
	msg = produto.mensagem(numeroMsg);
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Currency"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>FORTE SYSTEM</title>

<script type="text/javascript">
 function excluir(produtoID){
	if(confirm("Tem certeza que deseja Excluir esse produto?")){
		window.location.href="sis_delete_manager_produto.jsp?produtoID="+produtoID;
	}
 }
</script>

<script type="text/javascript" src="js/jquery.js"></script>
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
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_produto.jsp'" value="+ Novo Produto" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_tipo.jsp'" value="+ Novo Tipo de Produto" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_tipos.jsp'" value="Lista Tipos de Produto" />&nbsp;
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_insert_estoque.jsp'" value="Alimentar Estoque" />
 </td>
</tr>
<tr>
 <td valign="top">
 <br />
  <table width="940" align="center" cellpadding="0" cellspacing="0">
   <tr>
    <td colspan="11" align="center"><strong>LISTA DE PRODUTOS</strong></td>
   </tr>
   <tr>
     <td colspan="11" height="15" align="center"></font></td>
   </tr>
   <%if(request.getParameter("msg")!=null && request.getParameter("msg")!=""){%>
   <tr>
     <td colspan="11" height="15" align="center"><font color="#ff0000"><%=msg %></font></td>
   </tr>
   <%}%>
   <tr>
    <td colspan="11" height="40" align="left" valign="middle">
    
    <table width="730" align="left">
    <tr>
    <td width="356">
    
    <!-- Busca por C�digo -->
    <form name="formBuscaCodigo" method="post">
     <table width="335" style="border:1px solid #333; height:30px" align="left" cellpadding="0" cellspacing="0">
      <tr>
       <td width="259" align="right">
       <input type="text" name="codigo" maxlength="100" size="50" style="background-image:url(images/buscacodigo.png); height:18px; border:none"  onclick="this.style.backgroundImage = 'none'" onblur="if(this.value == '')this.style.backgroundImage = 'url(images/buscacodigo.png)'"/>
       </td>
       <td width="74" align="left"><input type="submit" class="botao" style="height:22px" name="BUSCARCODIGO" value="Buscar" /></td>
      </tr>
     </table>
    </form>
    <!-- Fim da Busca por C�digo -->
    </td>
    <td width="382">
    <!-- Busca por Marca -->  
    <form name="formBusca" method="post">
     <table width="335" style="border:1px solid #333; height:30px" align="left" cellpadding="0" cellspacing="0">
      <tr>
       <td width="259" align="right">
       <input type="text" name="nome" maxlength="100" size="50" style="background-image:url(images/buscamarca.png); height:18px; border:none"  onclick="this.style.backgroundImage = 'none'" onblur="if(this.value == '')this.style.backgroundImage = 'url(images/buscamarca.png)'"/>
       </td>
       <td width="74" align="left"><input type="submit" class="botao" style="height:22px" name="BUSCAR" value="Buscar" /></td>
      </tr>
     </table>
    </form>
    <!-- Fim da Busca por Marca-->
    </td>
    </tr>
    </table>
    
    </td>
   </tr>
   <tr bgcolor="#EEEEEE">
    <td width="80" align="left"><strong>Codigo</strong></td>
    <td width="200" align="left"><strong>Produto / Descri&ccedil;&atilde;o</strong></td>
    <td width="160" align="left"><strong>Tipo</strong></td>
    <td width="90" align="left"><strong>Preco</strong></td>
    <td width="70" align="center"><strong>Estoque</strong></td>
    <td width="40" align="center"></td>
    <td width="60" align="center"><strong>Es</strong></td>
    <td width="60" align="center"><strong>Ed</strong></td>
    <td width="60" align="center"><strong>At</strong></td>
    <td width="60" align="center"><strong>Rt</strong></td>
    <td width="60" align="center">
    <%if(nivel.equals("1") || nivel.equals("2") || nivel.equals("6")){ %>
    <strong>Ex</strong>
    <%}%>
    </td>
   </tr>
   <tr>
    <td colspan="11">
     <table id="tb1" width="940" align="center" cellpadding="0" cellspacing="0">  
      <tr>
       <td colspan="10" height="5"></td>
      </tr> 
<%
//Enquanto a Consulta retonar um resultada, Liste os Usu�rios do Sistema
while (rs.next()){
%>
   
   
<%
String valor = null;

Currency currency = Currency.getInstance("BRL");

DecimalFormat formato = new DecimalFormat("R$ #,##0.00");

valor = formato.format(rs.getDouble("preco"));
%>

   <tr>
    <td height="30" width="80" align="left"><font size="1"><%=rs.getString("codigo")%></font></td>
    <td height="30" width="200" align="left"><%=rs.getString("nome")%></td>
    <td width="160" height="30" align="left"><%=rs.getString("tipo")%></td>
    <td height="30" width="90" align="left"><%=valor%></td>
    
    <%
    //Verifica se o Estoque est� abaixo do minimo e avisa que � necess�rio Alimentar o Estoque
    if(rs.getInt("estoque") < rs.getInt("estoqueMinimo")){
    %>
    <td style="background-image:url(images/estoqueabaixo.png); color: #FFFFFF" width="70" align="center" title="Estoque est� Abaixo do M�nimo (<%=rs.getString("estoqueMinimo")%>)"><strong><%=rs.getString("estoque")%></strong></td>
    <%}else {%>
    <td width="70" align="center"><%=rs.getString("estoque")%></td>
    <%} %> 
    <td width="40" align="center"><%=rs.getString("unidade")%></td>
    <td width="60" align="center"><a href="sis_insert_estoque.jsp?fornecedorID=<%=rs.getString("fornecedorID")%>&produtoID=<%=rs.getString("produtoID")%>"><img src="ico/ico_estoque.png" width="20" height="20" border="0" title="Alimentar Estoque de <%=rs.getString("nome")%>" /></a></td>
    <td height="30" width="60" align="center"><a href="sis_update_produto.jsp?produtoID=<%=rs.getString("produtoID")%>"><img src="ico/ico_editar.png" width="20" height="20" border="0" title="Editar <%=rs.getString("nome")%>" /></a></td>
    
    <%
	//Verifica o status se est� ativo ou n�o
	String status = rs.getString("produtoAtivo");
	if(status.equals("S")){
	%>
    <td height="30" width="60" align="center">
     <%if(nivel.equals("1") || nivel.equals("2") || nivel.equals("6")){ %>
    <a href="sis_view_produtos.jsp?acao=1&produtoID=<%=rs.getString("produtoID")%>"><img src="ico/ico_ativo.png" width="20" height="20" border="0" title="Desativar <%=rs.getString("nome")%>" /></a>
     <%}else{%>
    	<img src="ico/ico_ativo.png" width="20" height="20" border="0" />
     <%}%>
    </td>
    <%}else if(status.equals("N")){%>
    <td height="30" width="60" align="center">
     <%if(nivel.equals("1") || nivel.equals("2") || nivel.equals("6")){ %>
    <a href="sis_view_produtos.jsp?acao=2&produtoID=<%=rs.getString("produtoID")%>"><img src="ico/ico_inativo.png" width="20" height="20" border="0" title="Ativar <%=rs.getString("nome")%>" /></a>
     <%}else{%>
     	<img src="ico/ico_inativo.png" width="20" height="20" border="0" />
     <%}%>
    </td>
    <%}%>
    
    <td height="30" width="60" align="center"><a href="sis_insert_retirada_estoque.jsp?produtoID=<%=rs.getString("produtoID")%>"><img src="ico/ico_retirada.png" width="20" height="20" title="Retirar Parte do Estoque de (<%=rs.getString("nome")%>)" /></a></td>
    <td height="30" width="60" align="center">
    <%if(nivel.equals("1") || nivel.equals("2") || nivel.equals("6")){ %>
    <a href="javascript:excluir(<%=rs.getString("produtoID")%>)"><img src="ico/ico_excluir.png" width="20" height="20" border="0" title="Excluir <%=rs.getString("nome")%>" /></a>
    <%}%>
    </td>
   </tr>
   <tr>
    <td colspan="11" align="center" style="height:1px"><hr style="border:1px solid #333333" /></td>
   </tr>

<%
}
%>
   </table>
   </td>
   </tr>
	
	<tr>
	 <td colspan="11" align="center"></td>
	</tr>
    <tr>
     <td colspan="11" align="center">
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
        var pager = new Pager('tb1', 24); 
        pager.init(); 
        pager.showPageNav('pager', 'pageNav'); 
        pager.showPage(1);
    </script>

</body>
</html>

<%
 //fecha a consulta
 st.close();
 rs.close();
%>