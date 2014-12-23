<%//@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<jsp:useBean id="endereco" class="servico.EnderecoEntrega" scope="page"></jsp:useBean>


<%
//Instancia um objeto do tipo Statement para ajudar query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
%>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
ResultSet rs01 = null;
ResultSet rs02 = null;
%>


<%
//Variaveis usadas para alimentar os campos
int clienteID = 0;
String logradouro = "";
String numero = "";
String complemento = "";
String bairro = "";
String cidade = "";
String uf = "";
String cep = "";
%>


<%
//Recupera o ID do Serviço trazido via URL e atribui ao objeto servico
endereco.servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));
servico.servicoID = endereco.servico.servicoID;
%>

<%
//Pesquisa Informações sobre o Servico
rs01 = st01.executeQuery(servico.pesquisaServico());
if(rs01.next()){
	clienteID = rs01.getInt("clienteID");
	endereco.cliente.clienteID = clienteID;
}
%>

<%
//Pesquisa se já existe um Endereço Cadastrado para esse Serviço
rs = st.executeQuery(endereco.enderecoPorServicoID());
if(rs.next()){
	logradouro = rs.getString("logradouro");
	numero = rs.getString("numero");
	complemento = rs.getString("complemento");
	bairro = rs.getString("bairro");
	cidade = rs.getString("cidade");
	uf = rs.getString("uf");
	cep = rs.getString("cep");
	

}else{
	//Caso não há um servço ele cadastra na hora
	
	endereco.logradouro = logradouro;
	endereco.numero = numero;
	endereco.complemento = complemento;
	endereco.bairro = bairro;
	endereco.cidade = cidade;
	endereco.uf = uf;
	endereco.cep = cep;
	
	st02.execute(endereco.salvaEndereco());
	response.sendRedirect("sis_endereco_obra.jsp?servicoID="+endereco.servico.servicoID);
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
	msg = endereco.mensagem(numeroMsg);
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

<link href="css/menu.css" rel="stylesheet" type="text/css" />
<link href="css/geral.css" rel="stylesheet" type="text/css" />
</head>

<body onload="javascript: document.form1.rua.focus();">

<div id="container">

<div id="topo">
 <jsp:include page="inc/menu_superior.jsp" />
</div>


<div id="corpo">
<table width="985" align="center" height="440">
<tr>
 <td height="25" bgcolor="#EEEEEE"><input type="button" class="botao" onclick="javascript: window.location.href='sis_view_contratos.jsp'" value="Lista de Contratos" />
   &nbsp;&nbsp;
   <input type="button" class="botao" onclick="javascript: window.location.href='sis_view_orcamento_servicos.jsp'" value="Lista de Orçamentos" /></td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center"><br />
 
 <form name="form1" method="post" action="sis_update_manager_endereco_obra.jsp">
 
 <table>
  <tr>
    <td height="20" colspan="3" align="center" valign="middle"><font color="#FF0000"><strong><%=msg%></strong></font></td>
  </tr>
  <tr>
        <td height="20" colspan="3" align="center" valign="middle" bgcolor="#CCCCCC">Cadastre o Endere&ccedil;o da Obra - CLIENTE: <strong><%=rs01.getString("clienteNomeFantasia")%></strong></td>
       </tr>
       <tr>
        <td colspan="2" align="left">Endereço</td>
        <td align="left">Número</td>
       </tr>
       <tr>
        <td colspan="2" align="left"><input name="rua" type="text" id="rua" value="<%=logradouro%>" size="45" maxlength="40"/></td>
        <td align="left"><input name="numero" type="text" id="numero" style="width:120px" onKeyPress="return numero(this)" value="<%=numero%>" size="14" maxlength="6"/></td>
       </tr>
       <tr>
        <td colspan="2" align="left">Complemento</td>
        <td align="left"></td>
       </tr>
       <tr>
         <td colspan="3" align="left"><input name="complemento" id="complemento" type="text" style="width:300px"  maxlength="40" onblur="getEndereco()" size="14" value="<%=complemento%>" /></td>
       </tr>
       <tr>
        <td colspan="2" align="left">CEP</td>
        <td align="left">Bairro</td>
       </tr>
       <tr>
         <td colspan="2" align="left"><input name="cep" id="cep" type="text" style="width:120px" onkeypress="return numero(this)" maxlength="8" onblur="getEndereco()" size="14" value="<%=cep%>" /></td>
         <td align="left"><input name="bairro" type="text" id="bairro" value="<%=bairro%>" size="45" maxlength="40"/></td>
       </tr>
       <tr>
        <td colspan="2" align="left">Cidade</td>
        <td align="left">UF</td>
       </tr>
       <tr>
        <td colspan="2" align="left"><input name="cidade" type="text" id="cidade" value="<%=cidade%>" size="45" maxlength="40"/></td>
        <td align="left">
        <select name="uf" id="uf" style="width:48px">
          <option  value="<%=uf%>" selected="selected"><%=uf%></option>
          <option value="AC">AC</option>
          <option value="AL">AL</option>
          <option value="AP">AP</option>
          <option value="AM">AM</option>
          <option value="BA">BA</option>
          <option value="CE">CE</option>
          <option value="DF">DF</option>
          <option value="ES">ES</option>
          <option value="GO">GO</option>
          <option value="MA">MA</option>
          <option value="MT">MT</option>
          <option value="MS">MS</option>
          <option value="MG">MG</option>
          <option value="PA">PA</option>
          <option value="PB">PB</option>
          <option value="PR">PR</option>
          <option value="PE">PE</option>
          <option value="PI">PI</option>
          <option value="SC">SC</option>
          <option value="SE">SE</option>
          <option value="SP">SP</option>
          <option value="RJ">RJ</option>
          <option value="RN">RN</option>
          <option value="RS">RS</option>
          <option value="RO">RO</option>
          <option value="RR">RR</option>
          <option value="TO">TO</option>                        
          </select>        </td>
       </tr>
       <tr>
        <td colspan="3" align="right">
        <input type="hidden" name="servicoID" value="<%=endereco.servico.servicoID%>" />
        <input type="submit" value="SALVAR" class="botao" />        </td>
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