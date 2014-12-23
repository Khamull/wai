<%@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>

<%
//Recupera o ID do Usu�rio
usuario.usuarioID = Integer.parseInt(request.getParameter("usuarioID"));

//Pesquisa dados do Usu�rio
rs = st.executeQuery(usuario.usuarioPorID());
%>

<%
//Trata mensagens
//variaveis que ser�o utilizadas para verifica��o
String msg = "";
int numeroMsg;
//verifica se foi passado alguma mensagem via URL
if(request.getParameter("msg") != null){
	numeroMsg = Integer.parseInt(request.getParameter("msg"));
	msg = usuario.mensagem(numeroMsg);
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2" />
<title>FORTE SYSTEM</title>

<script type="text/javascript">
function verForm(){
	var nome = document.form1.nome.value;
	var login = document.form1.login.value;
	var senhaA = document.form1.senha.value;
	var senhaB = document.form1.confirmaSenha.value;
	
	if(nome.length <= 2){
		alert("Favor informar o nome Completo!");
		document.form1.nome.focus();
		return false;
	}
	
	if(login.length <= 3){
		alert("Cadastre um login com mais de 3 digitos!");
		document.form1.login.focus();
		return false;
	}
	
	// ############  Verifica�oes de SENHA  ############
	if(senhaA == ""){
		alert("O campo Senha � Obrigat�rio!");
		document.form1.senha.focus();
		return false;
	}
	
	if(senhaA != senhaB){
		alert("As senhas nao sao iguais!\nFavor verificar");
		document.form1.senha.value = "";
		document.form1.confirmaSenha.value = "";
		document.form1.senha.focus();
		return false;
	}
	
	if(senhaA.length <= 3){
		alert("Cadastre uma Senha com mais de 3 Digitos!");
		document.form1.senha.value = "";
		document.form1.confirmaSenha.value = "";
		document.form1.senha.focus();
		return false;
	}
	
	if(senhaA == "1234" || senhaA == "12345" || senhaA == "123456" || senhaA == "1234567" || senhaA == "12345678"){
		alert(senhaA+" � uma senha muito Simples!\nPor favor escolha outra.");
		document.form1.senha.value = "";
		document.form1.confirmaSenha.value = "";
		document.form1.senha.focus();
		return false;
	}
	
	// ###################################################
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

<body onload="javascript:document.form1.nome.focus()">

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="400">
<tr>
 <td height="25" bgcolor="#EEEEEE">
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_usuarios.jsp'" value="Lista de Usu&aacute;rios" />
 </td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">
<table align="center" style="width:450px; height:200px; border:1px solid #333">
 <tr>
 <td>
 
<%if(rs.next()){ %>
 
 <form name="form1" method="post" action="sis_update_manager_usuario.jsp" onsubmit="return verForm(this)">
 <table width="400" align="center">
 <%if(request.getParameter("msg") != null){ %>
  <tr>
   <td colspan="3" align="center" bgcolor="#ff0000"><font color="#ffffff"><strong><%=msg %></strong></font></td>
  </tr>
 <%} %>
  <tr>
   <td colspan="3" align="center"><strong>EDITAR USU&Aacute;RIO</strong></td>
  </tr>
  <tr>
   <td width="127" align="left">Nome:</td>
   <td colspan="2" align="left"><input name="nome" type="text" size="50" maxlength="50" value="<%=rs.getString("usuarioNome") %>" /></td>
  </tr>
  <tr>
   <td align="left">Login:</td>
   <td colspan="2" align="left"><input type="text" name="login" maxlength="20" value="<%=rs.getString("usuarioLogin")%>" /></td>
  </tr>
  <tr>
   <td align="left" valign="top">Nova Senha:</td>
   <td colspan="2" align="left" valign="top"><input type="password" class="senha password" name="senha" title="Senha" value="********" maxlength="20" /></td>
  </tr>
  <tr>
   <td align="left">Confirme sua Senha:</td>
   <td colspan="2" align="left"><input type="password" name="confirmaSenha" maxlength="20"/></td>
  </tr>
  <tr>
   <td align="left">Tipo de Usu&aacute;rio:</td>
   <td width="132" align="left">
    <select name="nivel" style="width:125px">
     <option selected="selected" value="<%=rs.getString("usuarioNivel")%>"><%=usuario.nivelUsuario(rs.getInt("usuarioNivel")) %></option>
<%
//verifica se o Usuario � Administrador
String nivel = String.valueOf(session.getAttribute("nivel"));
if(nivel.equals("1")){
%>
     <option value="1">Nivel 1</option>
     <option value="2">Nivel 2</option>
     <option value="3">Nivel 3</option>
     <option value="4">Nivel 4</option>
     <option value="5">Nivel 5</option>
     <option value="6">Nivel 6</option>
<%
}
%>
    </select>
   </td>
   <td width="125" align="left"><a href="#" onclick="javascript: window.open('sis_view_niveis.jsp','niveis', 'width = 780; height = 600') "><img src="ico/ico_interrogacao.png" width="20" height="20" border="0" title="Ver Detalhes dos Niveis" /></a></td>
  </tr>
  <tr>
   <td colspan="3" align="left">
   <input type="submit" name="CADASTRAR" value="Cadastrar" />&nbsp;
   <input type="button" onclick="javascript:window.location.href='sis_view_usuarios.jsp'" value="Cancelar" />
   <input type="hidden" name="usuarioID" value="<%=rs.getString("usuarioID")%>" /></td>
   </tr>
 </table>
 </form>
 
<%} %>
 
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

</body>
</html>