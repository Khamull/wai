<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>

<%
//String acessar= "";
//if(request.getParameter("origem")!=null){
   session.setAttribute("acesso", "ok");
//}
%>


<%
//Atribuindo Variaveis
String erroSessao = "";
if(request.getParameter("erro") != null){
 erroSessao = request.getParameter("erro");
}
%>


<%
//Verifica se veio o parametro
if((String)session.getAttribute("acesso") == "ok" || erroSessao.equals("3")){
%>


<%
//Trata erros
//Variaveis que ser�o utilizadas no tratamento
String erro = "";
int numeroErro;

//verifica se foi mandada alguma mensagem de erro na URL
if(request.getParameter("erro") != null){
	numeroErro = Integer.parseInt(request.getParameter("erro"));
	//Depois de passado pelo metodo � atribuido a mensagem de erro � variavel
	erro = usuario.erro(numeroErro);
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FORTE SYSTEM</title>

<link href="css/geral.css" rel="stylesheet" type="text/css" />

<script src="SpryAssets/SpryValidationPassword.js" type="text/javascript"></script>
<script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<link href="SpryAssets/SpryValidationPassword.css" rel="stylesheet" type="text/css" />
<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">

function removeCaracteres1(){
	var a = document.form1.usuario.value;
	var b = a.replace(",","");
	
	b = b.replace("'","");
	b = b.replace("*","");
	b = b.replace("/","");
	b = b.replace("\\","");
	b = b.replace("$","");
	b = b.replace("%","");
	b = b.replace("&","");
	b = b.replace("#","");
	b = b.replace("\"","");
	b = b.replace("+","");
	b = b.replace("|","");
	b = b.replace("(","");
	b = b.replace(")","");
	b = b.replace(">","");
	b = b.replace("<","");
	b = b.replace("?","");
	b = b.replace("�","");
	b = b.replace("-","");
	b = b.replace("!","");
	document.form1.usuario.value = b;
}

function removeCaracteres2(){
	var a = document.form1.senha.value;
	var b = a.replace(",","");
	
	b = b.replace("'","");
	b = b.replace("*","");
	b = b.replace("/","");
	b = b.replace("\\","");
	b = b.replace("$","");
	b = b.replace("%","");
	b = b.replace("&","");
	b = b.replace("#","");
	b = b.replace("\"","");
	b = b.replace("+","");
	b = b.replace("|","");
	b = b.replace("(","");
	b = b.replace(")","");
	b = b.replace(">","");
	b = b.replace("<","");
	b = b.replace("?","");
	b = b.replace("�","");
	b = b.replace("-","");
	b = b.replace("!","");
	document.form1.senha.value = b;
}
</script>

</head>

<body onload="document.form1.usuario.focus();">

<div id="container">

<div id="topo"></div>


<div id="corpo">

<table width="980" height="440" align="center">
 <tr>
  <td valign="top">
  <br /><br /><br /><br />
  
  <!--Contorno do Formul�rio -->
  <table align="center" width="447" height="195" style="background-image:url(images/login.png)">
   <tr>
    <td height="50"></td>
   </tr>
   <tr>
   <td align="center" valign="middle">
  
  
   <!--Formul�rio de Login e Senha -->
    <form name="form1" method="post" action="login.jsp">
    <table width="329" align="center">
     <tr>
      <td width="321" align="left"><span id="sprytextfield1">USU&Aacute;RIO:
          <input type="text" name="usuario" id="usuario" maxlength="20" onkeypress="removeCaracteres1()" onblur="removeCaracteres1()" />
          <span class="textfieldRequiredMsg">Campo Obrigat&oacute;rio</span></span></td>
     </tr>
     <tr>
      <td align="left"><span id="sprypassword2">SENHA:&nbsp;&nbsp;&nbsp;
          <input type="password" name="senha" id="senha"  maxlength="20" onkeypress="removeCaracteres2()" onblur="removeCaracteres2()"/>
<span class="passwordRequiredMsg">Campo Obrigat&oacute;rio</span></span></td>
     </tr>
     <tr>
      <td align="left">
      <input type="submit" style="background-color:#003366; color:#FFFFFF;" name="logar" id="logar" value="ACESSAR" />
      <font color="#ff0000"><%=erro%></font>
      </td>
     </tr>
    </table>
    </form>
   <!--Fim do Formul�rio-->
  
  
    </td>
    </tr>
   </table>
   <!--Fim da Borda do Formul�rio-->
  
  </td>
 </tr>
</table>

</div>


<div id="rodape"><jsp:include page="inc/rodape.html" /></div>

</div>
<script type="text/javascript">
var sprypassword2 = new Spry.Widget.ValidationPassword("sprypassword2");
var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1");
</script>
</body>
</html>

<%
}else{
 response.sendRedirect("http://fortesystem.net.br");
}
%>	