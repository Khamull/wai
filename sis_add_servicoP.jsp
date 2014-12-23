<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="servico" class="servico.Servico" scope="page"></jsp:useBean>

<jsp:useBean id="servicos" class="servico.Servicos" scope="page"></jsp:useBean>

<jsp:useBean id="servicoporcentagem" class="servico.ServicoPorcentagem" scope="page"></jsp:useBean>

<jsp:useBean id="produtoestoque" class="cadastro.ProdutoEstoque" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
Statement st04 = con.createStatement();
Statement st05 = con.createStatement();
%>

<%
//Instancia um objeto do tipo Resultset para receber o valor de uma consulta
ResultSet rs01 = null;
ResultSet rs02 = null;
ResultSet rs03 = null;
ResultSet rs04 = null;
ResultSet rs05 = null;
%>

<%
//Verifica se fois passado parametro via URL dando ordem para inclusão
if(request.getParameter("incluir")!=null){
	
	//Recupera os valores trazidos do formulário e atribui ao objeto servicoporcentagem
	servicoporcentagem.servico.servicoID	= Integer.parseInt(request.getParameter("servicoID"));
	servicoporcentagem.servicos.servicoID = Integer.parseInt(request.getParameter("servID"));
	servicoporcentagem.valor 				= Float.parseFloat(request.getParameter("total"));
	servicoporcentagem.descricao			= request.getParameter("servicos");
	servicoporcentagem.quantidade			= Float.parseFloat(request.getParameter("valor").replace(",","."));
	//Atribui o valor ao objeto servico
	servico.servicoID				= servicoporcentagem.servico.servicoID;
	
	
	//Insere o produto na base de dados
	st.execute(servicoporcentagem.salvaServico());
	
	
	
	//Pesquisa o valor total atual desse serviço
	rs01 = st01.executeQuery(servico.pesquisaServico());
	
	float valorAtual = 0;
	boolean alterado = false;
	
	if(rs01.next()){
		valorAtual = rs01.getFloat("valor");
		alterado = true;
	}
	
	//Soma ao novo valor vindo do formulário
	servico.valor = (valorAtual + servicoporcentagem.valor);
	
	//Altera o valor total do servico
	st.execute(servico.atualizaValorServico());
	
	
	//Muda o Status de visualizado para (Não-Visualizado)
	st.execute(servico.naoVisualizado());
	
	
	//Após alterado fecha a página e atualiza a página de pai
	if(alterado){%>
		
		<script type="text/javascript">
		 window.close();  
		 window.opener.location.reload();
		</script>
		
	<%}
	
}
%>


<%
//Pesquisa todos os Serviços cobrados por Metro Quadrado para Listar na Combobox
rs02 = st02.executeQuery(servicos.servicosP());
%>


<%
//Declara uma variavel tipo Flag para verificar se pesquisou ou não
boolean pesquisou = false;

//Faz a Busca sobre detalhes do Produto
if(request.getParameter("buscarPorServicoM")!=null){
	servicos.servicoID = Integer.parseInt(request.getParameter("servicosID"));
	rs03 = st03.executeQuery(servicos.servicoPorID());
	pesquisou = true;
}

String servicoNome = "";
String servicoValor = "";

//Se a consulta trouxer um resultado, atribui as variaveis
if(pesquisou){
	if(rs03.next()){
		servicoNome = rs03.getString("servicoTitulo");
		servicoValor = rs03.getString("valorP");
		servicos.servicoID = rs03.getInt("servicoID");
	}
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adicionar Servico</title>


<style type="text/css">

body{
	background-color:#FFFFFF;
	font-family:Arial, Helvetica, sans-serif;
	font-size:12px;
}

input.botao {
	background-color:#FFFFFF;
	border:1px solid #003366;
	color:#333;
	font-family:arial, Geneva, sans-serif;
	font-size:13px;
	}

</style>

<script type="text/javascript">

function verForm(){
	
	if(document.form1.servicos.value == ""){
		alert("Escolha um servico!");
		document.form1.servicosID.focus();
		return false;
	}
	
	if(document.form1.valor.value == ""){
		alert("Informe o valor desse serviço!");
		document.form1.valor.focus();
		return false;
	}
	

	verPonto();
}



//Valida se o Campo é Numérico (COM VÍRGULA " , " )
function numero()	{
if (event.keyCode<48 && event.keyCode!=44 || event.keyCode>57 && event.keyCode!=44){return false;} 
}


//Verifca se tem "," ao invés de "." e Substitui
function verPonto(){
	var valor = document.form1.valor.value;
		
	valor = valor.replace(",",".");
		
	document.form1.valor.value = valor;
}


//Metodo para chamar uma busca por Produto
function bucarPorServico(){

	if(document.form1.servicosID.value == ""){
		alert("Antes de Buscar,\nselecione um serviço na Lista");
		document.form1.servicosID.focus();
		return false;
	}else{
		var servicosID = document.form1.servicosID.value;
		var servicoID = document.form1.servicoID.value
		window.location.href="sis_add_servicoP.jsp?servicosID="+servicosID+"&buscarPorServicoM=ok&servicoID="+servicoID;
	}
}



function porcentagem(){

	var valorPorcento = parseFloat(document.form1.valor.value);
	var valorServico = document.form1.qtdMetros.value;
	
	valorServico = parseFloat(valorServico.replace(",","."));
	
	
	
	document.form1.total.value = ((valorPorcento *  valorServico) / 100).toFixed(2);
	//document.form1.total.value.toFixed(2);

}

</script>

</head>
<body onLoad="javascript: document.form1.produtoID.focus()">

<form name="form1" method="get" action="sis_add_servicoP.jsp" onSubmit="return verForm(this)" >
<table width="490" border="0" align="center" cellpadding="2" cellspacing="2">
 <tr bgcolor="#EEEEEE">
  <td colspan="3" align="center"><strong>INSERIR NOVO SERVI&Ccedil;O</strong></td>
 </tr>
 <tr>
   <td align="left">Descri&ccedil;&atilde;o</td>
   <td width="274" align="left">
   <select name="servicosID" style="width:265px;">
    <option value="">Selecione um servi&ccedil;o...</option>
    <%while(rs02.next()){ %>
     <option value="<%=rs02.getInt("servicoID") %>"><%=rs02.getString("servicoTitulo") %></option>
    <%} %>
   </select>   </td>
   <td width="80" align="left"><input type="button" name="buscarPorServicoM" value="Buscar" onClick="javascript: bucarPorServico()"></td>
 </tr>
 <tr>
   <td colspan="3" align="center"><hr style="border:1px solid #006699"></td>
 </tr>
 <tr>
   <td align="left">Serviço:</td>
   <td colspan="2" align="left"><input type="text" name="servicos" value="<%=servicoNome %>" readonly style="width:260px"></td>
 </tr>
 <tr>
  <td width="116" align="left">Porcentagem (%)</td>
  <td colspan="2" align="left"><input name="valor" type="text" onKeyPress="return numero(this.value)" value="<%=servicoValor %>" size="20" maxlength="10" >
  &nbsp;
  <input type="hidden" name="servicoID" value="<%=request.getParameter("servicoID")%>" >
  <input type="hidden" name="incluir" value="1">
  <input type="hidden" name="servID" value="<%=servicos.servicoID%>">
  </td>
 </tr>
 <tr>
   <td colspan="3" align="center"><hr style="border:1px solid #006699"></td>
 </tr>
 <tr>
  <td width="116" align="left">Valor</td>
  <td colspan="2" align="left">
  <input name="qtdMetros" type="text" id="qtdMetros" onBlur="porcentagem()" value="0" onKeyPress="return numero(this.value)" size="20" maxlength="10" >
  &nbsp;
<input type="button" name="calcularMetragem" onClick="porcentagem()" value="Calcular Porcentagem">
  </td>
 </tr>
 <tr>
  <td width="116" align="left">Valor TOTAL</td>
  <td colspan="2" align="left"><input name="total" type="text" onBlur="porcentagem()" value="0.00" size="20" maxlength="10" >
  </td>
 </tr>
 <tr>
  <td align="right" colspan="3"><input type="submit" name="CADASTRAR" value="Incluir Serviço" class="botao" ></td>
 </tr>
</table>
</form>

</body>
</html>