<%@ page import="java.sql.*" %>
<%@ include file="../inc/conexao.jsp" %>

<jsp:useBean id="empresa" class="cadastro.Empresa" scope="page"></jsp:useBean>

<jsp:useBean id="caixa" class="financeiro.LivroCaixa" scope="page"></jsp:useBean>

<jsp:useBean id="data" class="formatar.Datas" scope="page"></jsp:useBean>

<jsp:useBean id="lancamentos" class="financeiro.Lancamentos" scope="page"></jsp:useBean>

<%
//Variavel que recebe o nivel do Usu�rio
String nivelUsuario = String.valueOf(session.getAttribute("nivel"));;

//Se o nivel for restrito enviar para a p�gina de erro
if(nivelUsuario.equals("2") || nivelUsuario.equals("3") || nivelUsuario.equals("4") || nivelUsuario.equals("6")){
	response.sendRedirect("forbiden.jsp");
}
%>

<%
//Instancia um Objeto do tipo Statement para ajudar na Query
Statement st0 = con.createStatement();
Statement st01 = con.createStatement();
Statement st02 = con.createStatement();
Statement st03 = con.createStatement();
Statement st04 = con.createStatement();
%>

<%
//Instancia um Objeto do tipo ResultSet para receber o resultado de uma consulta
ResultSet rs0 = null;
ResultSet rs = null;
ResultSet rs01 = null;
ResultSet rs02 = null;
ResultSet rs03 = null;
ResultSet rs04 = null;
%>

<%
//Pesquisa informa��es relacionadas � Empresa
rs0 = st0.executeQuery(empresa.dadosEmpresa());
%>


<%
//Verifica se a consulta retornou algum valor e atribui �s Variaveis
String nomeFantasia = "";
String endereco = "";
String bairro = "";
String cidade = "";
String telefone = "";

	if(rs0.next()){
		nomeFantasia = rs0.getString("nomeFantasia");
		endereco = rs0.getString("rua")+", "+rs0.getString("numero");
		bairro = rs0.getString("bairro");
		cidade = rs0.getString("cidade");
		telefone = rs0.getString("telefone");
	}
%>


<%
//Verifica se foi passado parametro via URL
if(request.getParameter("livroID")!=null){
	caixa.livroID = Integer.parseInt(request.getParameter("livroID"));
	lancamentos.livro.livroID = caixa.livroID;
}


//Pesquisa Informa��es sobre o Banco Selecionado
rs = st.executeQuery(caixa.bancoPorID());
%>


<%

//Variaveis que serao usadas para a Data
String diaInicio = "";
String diaFim = "";
String mesInicio = "";
String mesFim = "";
String anoInicio = "";
String anoFim = "";
String dataInicio = "";
String dataFim = "";


//Verifica se foi passado parametro de data e Trata a Data
if(request.getParameter("diaA")!=null){
	diaInicio 	= request.getParameter("diaA");
	diaFim 		= request.getParameter("diaB");
	mesInicio 	= request.getParameter("mesA");
	mesFim		= request.getParameter("mesB");
	anoInicio	= request.getParameter("anoA");
	anoFim		= request.getParameter("anoB");
}

//Forma a Data para a Pesquisa
dataInicio = anoInicio+"-"+mesInicio+"-"+diaInicio;
dataFim = anoFim+"-"+mesFim+"-"+diaFim;


	//Retira um dia da Data Inicio para a Pesquisa de Valor Anterior
	String ultimaData = data.subtrairIntervalo(dataInicio, -1);

	
//Pesquisa os Lan�amentos de Acordo com a Data Passada
rs01 = st01.executeQuery(lancamentos.listaRecebimentos(dataInicio, dataFim));

%>


<%
//Verifica o Total de Entrada e o Total de Saida
rs02 = st02.executeQuery(lancamentos.listaRecebimentos(dataInicio, dataFim));

double totalEntrada = 0;
double totalSaida = 0;

while(rs02.next()){
	
	String tipoA = rs02.getString("tipo");
	  if(tipoA.equals("R")){
		  totalEntrada += rs02.getDouble("valor");
	  }else if(tipoA.equals("P")){
		  totalSaida += rs02.getDouble("valor");		  
	  }else if(tipoA.equals("D")){
		  totalEntrada += rs02.getDouble("valor");
	  }else if(tipoA.equals("T")){
		  totalSaida += rs02.getDouble("valor");
	  }
	
}
%>

<%
//Usado para Formatar o Valor para Moeda
Currency currency = Currency.getInstance("BRL");

DecimalFormat formato = new DecimalFormat("R$ #,##0.00");
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Currency"%>
<%@page import="java.text.DecimalFormat"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> - </title>

<style type="text/css">
 body, html{
	 margin:0px;
	 border:0px;
	 font-family:Arial, Helvetica, sans-serif;
	 font-size:12px;
 }
 
 .borda{
	border:1px dashed #666; 
	text-align:left;
	height:18px;
	padding:2px;
 }
</style>

</head>

<%if(rs.next()){ %>

 <%
 //Atribui os valores de data de cria��o do caixa e saldo inicial �s variaveis
 String dataCriacaoBanco = rs.getString("dataInicio");
 double valorInicial = rs.getDouble("valorInicial");
 
 //Variavel que ir� receber o valor total antes da pesquisa
 double valorEmCaixa = 0;

 //Pesquisa os Lan�amentos desde quando criou o Banco at� a primeira data passada
 rs03 = st03.executeQuery(lancamentos.listaRecebimentos(dataCriacaoBanco, ultimaData));
 
 
 	while(rs03.next()){
		if(rs03.getString("tipo").equals("R") && rs03.getString("vendaID").equals("0")){
			valorEmCaixa += rs03.getDouble("valor");
		}else if(rs03.getString("tipo").equals("C")){
			valorEmCaixa -= rs03.getDouble("valor");	
		}else if(rs03.getString("tipo").equals("R")){
 			valorEmCaixa += rs03.getDouble("valor");
 		}else if(rs03.getString("tipo").equals("P")){
 			valorEmCaixa -= rs03.getDouble("valor");
 		}else if(rs03.getString("tipo").equals("D")){
 			valorEmCaixa += rs03.getDouble("valor");
 		}else if(rs03.getString("tipo").equals("T")){
 			valorEmCaixa -= rs03.getDouble("valor");
 		}
 	}
 	
 	valorEmCaixa += valorInicial; //Soma todos os lan�amentos com o valor inicial do caixa
 	
 %>

 <%
 //Trata o Saldo
 String saldo = "0";
 saldo = formato.format(rs.getDouble("saldo"));
 %>

<body bgcolor="#CCCCCC">

<!-- PRIMEIRA P�GINA -->
<table align="center" cellpadding="0" cellspacing="0" width="630" height="980" style="1px solid border:#000000; background-color:#FFFFFF">
 <tr>
  <td align="center" valign="middle">
  
  <!-- Borda 1 -->
   <table width="590" height="950" cellpadding="0" cellspacing="0" style="border:1px solid none" align="center">
    <tr>
     <td align="center" valign="top" height="120">
      <!-- Esse � o espa�o para que apare�a o cabe�alho -->
      <table width="585" height="120" border="0" align="center" cellpadding="0" cellspacing="0">
       <tr>
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Iprimir Relatorio"></a></td>
        <td width="300" height="15" align="center"><font size="4"><strong><%=nomeFantasia %></strong></font></td>
        <td width="140" rowspan="5" align="center">&nbsp;</td>
       </tr>
       <tr>
        <td height="15" align="center"><strong><%=endereco %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=bairro %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=cidade %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=telefone %></strong></td>
        </tr>
       <tr>
        <td align="center" colspan="3"><hr></td>
       </tr>
       <tr>
        <td height="15" colspan="3" align="center"><strong>RELATORIO - LIVRO CAIXA - <%=rs.getString("banco") %> ( de <%=data.converteDeData(dataInicio) %>&nbsp;&nbsp; &agrave; &nbsp;&nbsp;<%=data.converteDeData(dataFim) %> ) </strong>
        <%if(rs.getDouble("saldo")<=0){%>
         &nbsp;Saldo Atual: <font color="#FF0000"><%=saldo %></font>
        <%}else{%>
         &nbsp;Saldo Atual: <%=saldo %>
        <%}%>
        </td>
       </tr>
       <tr>
        <td align="center" colspan="3"><hr></td>
       </tr>
      </table>
     </td>
    </tr>
    <tr>
     <td align="center" valign="top">
     
     <!-- ##########################   INICIO DO RELATORIO ######################## -->
      <table border="0" cellpadding="0" cellspacing="0" width="585" align="center">
      <%
  //Variavel que ir� receber os valores de ACRESCIMO e DECRESCIMO para sempre mostrar o Total
  double totalAtual = valorEmCaixa;
  String total = "0";
  %>
  
  <%
  //Contador 
  int i = 0;//contar� quantas vezes foi passado pelo la�o ( while )
  int j = 0;//receber� o MOD da divis�o por 2 ( 0 ou 1 )
  %>
  
  <%
  //Muda a cor da Linha
  String[] cor = new String[2];
  cor[0] = "#F1F1F1";
  cor[1] = "#FFFFFF";
  %>
  
  	<tr bgcolor="#DDDDDD">
       <td width="28" align="center">&nbsp;</td>
       <td width="86" align="left" bgcolor="#DDDDDD"><strong>Lan&ccedil;amento</strong></td>
       <td width="98" align="left" bgcolor="#DDDDDD"><strong>N&deg; Doc</strong></td>
       <td colspan="2" align="left" bgcolor="#DDDDDD"><strong>Hist&oacute;rico</strong></td>
       <td align="left" bgcolor="#DDDDDD"><strong>Entrada</strong></td>
       <td align="left" bgcolor="#DDDDDD"><strong>Sa&iacute;da</strong></td>
       <td align="center" bgcolor="#DDDDDD"><strong>Total</strong></td>
      </tr> 
      
   <%
    int ln = 2;
    while(rs01.next()){
   %>
  
  
  <%
      //Verifica se ja preecheu as 54 linhas e da um espa�amento
      if(ln == 55){
      %>
      <tr>
       <td colspan="8" height="170" valign="bottom">
       
       <table width="585" border="0" align="center" cellpadding="0" cellspacing="0">
       <tr>
        <td colspan="4" height="32"></td>
       </tr>
       <tr>
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Iprimir Relatorio"></a></td>
        <td width="300" height="15" align="center"><font size="4"><strong><%=nomeFantasia %></strong></font></td>
        <td width="140" rowspan="5" align="center">&nbsp;</td>
       </tr>
       <tr>
        <td height="15" align="center"><strong><%=endereco %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=bairro %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=cidade %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=telefone %></strong></td>
        </tr>
       <tr>
        <td align="center" colspan="3"><hr></td>
       </tr>
       <tr>
        <td height="15" colspan="3" align="center"><strong>RELATORIO - LIVRO CAIXA - <%=rs.getString("banco") %> ( de <%=data.converteDeData(dataInicio) %>&nbsp;&nbsp; &agrave; &nbsp;&nbsp;<%=data.converteDeData(dataFim) %> )</strong>
        <%if(rs.getDouble("saldo")<=0){%>
         &nbsp;Saldo Atual: <font color="#FF0000"><%=saldo %></font>
        <%}else{%>
         &nbsp;Saldo Atual: <%=saldo %>
        <%}%>
        </td>
       </tr>
       <tr>
        <td align="center" colspan="3"><hr></td>
       </tr>
      </table>
       
       </td>
      </tr>
      <tr bgcolor="#DDDDDD">
       <td width="28" align="center">&nbsp;</td>
       <td width="86" align="left" bgcolor="#DDDDDD"><strong>Lan&ccedil;amento</strong></td>
       <td width="98" align="left" bgcolor="#DDDDDD"><strong>N&deg; Documento</strong></td>
       <td colspan="2" align="left" bgcolor="#DDDDDD"><strong>Hist&oacute;rico</strong></td>
       <td align="left" bgcolor="#DDDDDD"><strong>Entrada</strong></td>
       <td align="left" bgcolor="#DDDDDD"><strong>Sa&iacute;da</strong></td>
       <td align="center" bgcolor="#DDDDDD"><strong>Total</strong></td>
      </tr> 
      <%
      //Se ja tiver preenchido reinicializa o valor do contador
      ln = 2;
      }
      %> 
  
  <%
  //Verifica a cor que ser� usada
  j = (i % 2); //Essa divis�o atribuir� � variavel "j" apenas o Resto da Divis�o
  %>
  
  <%
  //Trata a Data
  Date dataLancamento = rs01.getDate("data");
  String dataLanc = String.valueOf(dataLancamento);
  dataLanc = data.converteDeData(dataLanc);
  
  //Trata valor
  String valor = "0";
  valor = formato.format(rs01.getDouble("valor"));
  
  %>
  
  <%
  //Verifica se � um um pagamento ou um Recebimento antes de mostrar na tela
  String tipo = rs01.getString("tipo");
  String venID = rs01.getString("vendaID");
  if(tipo.equals("R") && venID.equals("0")){
  %>
  
  <%
  //Soma valor ao total
  totalAtual += rs01.getDouble("valor");
  //Formata o Valor
  total = formato.format(totalAtual);
  %>
  
  <tr bgcolor="<%=cor[j]%>">
   <td height="15" align="center"><font color="#666666" size="1"><%=(i+1)%></font></td>
   <td align="left"><%=dataLanc %></td>
   <td align="left"><%=rs01.getString("lancamentoID") %></td>
   <td colspan="2" align="left">Cheque Devolvido (Pago)</td>
   <td align="left"><font color="#009900"><%=valor %></font></td>
   <td align="left"></td>
   <td align="right">
   <%if(totalAtual <= 0){ %>
   <font color="#FF0000"><%=total %></font>
   <%}else{ %>
   <font color="#0000FF"><%=total %></font>
   <%} %>
   </td>
  </tr>
  
  <%ln++;%>
  <%
      //Verifica se ja preecheu as 54 linhas e da um espa�amento
      if(ln == 55){
      %>
      <tr>
       <td colspan="8" height="170" valign="bottom">
       
       <table width="585" border="0" align="center" cellpadding="0" cellspacing="0">
       <tr>
        <td colspan="4" height="32"></td>
       </tr>
       <tr>
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Iprimir Relatorio"></a></td>
        <td width="300" height="15" align="center"><font size="4"><strong><%=nomeFantasia %></strong></font></td>
        <td width="140" rowspan="5" align="center">&nbsp;</td>
       </tr>
       <tr>
        <td height="15" align="center"><strong><%=endereco %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=bairro %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=cidade %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=telefone %></strong></td>
        </tr>
       <tr>
        <td align="center" colspan="3"><hr></td>
       </tr>
       <tr>
        <td height="15" colspan="3" align="center"><strong>RELATORIO - LIVRO CAIXA - <%=rs.getString("banco") %> ( de <%=data.converteDeData(dataInicio) %>&nbsp;&nbsp; &agrave; &nbsp;&nbsp;<%=data.converteDeData(dataFim) %> )</strong>
        <%if(rs.getDouble("saldo")<=0){%>
         &nbsp;Saldo Atual: <font color="#FF0000"><%=saldo %></font>
        <%}else{%>
         &nbsp;Saldo Atual: <%=saldo %>
        <%}%>
        </td>
       </tr>
       <tr>
        <td align="center" colspan="3"><hr></td>
       </tr>
      </table>
       
       </td>
      </tr>
      <tr bgcolor="#DDDDDD">
       <td width="28" align="center">&nbsp;</td>
       <td width="86" align="left" bgcolor="#DDDDDD"><strong>Lan&ccedil;amento</strong></td>
       <td width="98" align="left" bgcolor="#DDDDDD"><strong>N&deg; Documento</strong></td>
       <td colspan="2" align="left" bgcolor="#DDDDDD"><strong>Hist&oacute;rico</strong></td>
       <td align="left" bgcolor="#DDDDDD"><strong>Entrada</strong></td>
       <td align="left" bgcolor="#DDDDDD"><strong>Sa&iacute;da</strong></td>
       <td align="center" bgcolor="#DDDDDD"><strong>Total</strong></td>
      </tr> 
      <%
      //Se ja tiver preenchido reinicializa o valor do contador
      ln = 2;
      }
      %>
  
  <%}else if(tipo.equals("C")){ %>
  
  <%
  //Subtrai valor ao total
  totalAtual -= rs01.getDouble("valor");
  //Formata o Valor
  total = formato.format(totalAtual);
  %>
  
  <tr bgcolor="<%=cor[j]%>">
   <td height="15" align="center"><font color="#666666" size="1"><%=(i+1)%></font></td>
   <td height="15" align="left"><%=dataLanc %></td>
   <td height="15" align="left"><%=rs01.getString("lancamentoID") %></td>
   <td height="15" colspan="2" align="left">Cheque Devolvido</td>
   <td height="15" align="left"></td>
   <td height="15" align="left"><font color="#990000"><%=valor %></font></td>
   <td height="15" align="right">
   <%if(totalAtual <= 0){ %>
   <font color="#FF0000"><%=total %></font>
   <%}else{ %>
   <font color="#0000FF"><%=total %></font>
   <%} %>
   </td>
  </tr>
  
  <%ln++;%>
  <%
      //Verifica se ja preecheu as 54 linhas e da um espa�amento
      if(ln == 55){
      %>
      <tr>
       <td colspan="8" height="170" valign="bottom">
       
       <table width="585" border="0" align="center" cellpadding="0" cellspacing="0">
       <tr>
        <td colspan="4" height="32"></td>
       </tr>
       <tr>
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Iprimir Relatorio"></a></td>
        <td width="300" height="15" align="center"><font size="4"><strong><%=nomeFantasia %></strong></font></td>
        <td width="140" rowspan="5" align="center">&nbsp;</td>
       </tr>
       <tr>
        <td height="15" align="center"><strong><%=endereco %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=bairro %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=cidade %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=telefone %></strong></td>
        </tr>
       <tr>
        <td align="center" colspan="3"><hr></td>
       </tr>
       <tr>
        <td height="15" colspan="3" align="center"><strong>RELATORIO - LIVRO CAIXA - <%=rs.getString("banco") %> ( de <%=data.converteDeData(dataInicio) %>&nbsp;&nbsp; &agrave; &nbsp;&nbsp;<%=data.converteDeData(dataFim) %> )</strong>
        <%if(rs.getDouble("saldo")<=0){%>
         &nbsp;Saldo Atual: <font color="#FF0000"><%=saldo %></font>
        <%}else{%>
         &nbsp;Saldo Atual: <%=saldo %>
        <%}%>
        </td>
       </tr>
       <tr>
        <td align="center" colspan="3"><hr></td>
       </tr>
      </table>
       
       </td>
      </tr>
      <tr bgcolor="#DDDDDD">
       <td width="28" align="center">&nbsp;</td>
       <td width="86" align="left" bgcolor="#DDDDDD"><strong>Lan&ccedil;amento</strong></td>
       <td width="98" align="left" bgcolor="#DDDDDD"><strong>N&deg; Documento</strong></td>
       <td colspan="2" align="left" bgcolor="#DDDDDD"><strong>Hist&oacute;rico</strong></td>
       <td align="left" bgcolor="#DDDDDD"><strong>Entrada</strong></td>
       <td align="left" bgcolor="#DDDDDD"><strong>Sa&iacute;da</strong></td>
       <td align="center" bgcolor="#DDDDDD"><strong>Total</strong></td>
      </tr> 
      <%
      //Se ja tiver preenchido reinicializa o valor do contador
      ln = 2;
      }
      %>
  
  <%}else if(tipo.equals("R")){ %>
  
  <%
  //Soma valor ao total
  totalAtual += rs01.getDouble("valor");
  //Formata o Valor
  total = formato.format(totalAtual);
  %>
  
  <tr bgcolor="<%=cor[j]%>">
   <td height="15" align="center"><font color="#666666" size="1"><%=(i+1)%></font></td>
   <td height="15" align="left"><%=dataLanc %></td>
   <td height="15" align="left"><%=rs01.getString("lancamentoID") %></td>
   <td height="15" colspan="2" align="left">
   Venda N&deg; <%=rs01.getString("vendaID") %> - 
   <%if(rs01.getString("formID").equals("4") || rs01.getString("formID").equals("5")){%>
   Cheque
   <%}else{%>
   <%=rs01.getString("descricao") %>
   <%}%></td>
   <td height="15" align="left"><font color="#009900"><%=valor %></font></td>
   <td height="15" align="left"></td>
   <td height="15" align="right">
   <%if(totalAtual <= 0){ %>
   <font color="#FF0000"><%=total %></font>
   <%}else{ %>
   <font color="#0000FF"><%=total %></font>
   <%} %>
   </td>
  </tr>
  
  <%ln++;%>
  <%
      //Verifica se ja preecheu as 54 linhas e da um espa�amento
      if(ln == 55){
      %>
      <tr>
       <td colspan="8" height="170" valign="bottom">
       
       <table width="585" border="0" align="center" cellpadding="0" cellspacing="0">
       <tr>
        <td colspan="4" height="32"></td>
       </tr>
       <tr>
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Iprimir Relatorio"></a></td>
        <td width="300" height="15" align="center"><font size="4"><strong><%=nomeFantasia %></strong></font></td>
        <td width="140" rowspan="5" align="center">&nbsp;</td>
       </tr>
       <tr>
        <td height="15" align="center"><strong><%=endereco %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=bairro %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=cidade %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=telefone %></strong></td>
        </tr>
       <tr>
        <td align="center" colspan="3"><hr></td>
       </tr>
       <tr>
        <td height="15" colspan="3" align="center"><strong>RELATORIO - LIVRO CAIXA - <%=rs.getString("banco") %> ( de <%=data.converteDeData(dataInicio) %>&nbsp;&nbsp; &agrave; &nbsp;&nbsp;<%=data.converteDeData(dataFim) %> )</strong>
        <%if(rs.getDouble("saldo")<=0){%>
         &nbsp;Saldo Atual: <font color="#FF0000"><%=saldo %></font>
        <%}else{%>
         &nbsp;Saldo Atual: <%=saldo %>
        <%}%>
        </td>
       </tr>
       <tr>
        <td align="center" colspan="3"><hr></td>
       </tr>
      </table>
       
       </td>
      </tr>
      <tr bgcolor="#DDDDDD">
       <td width="28" align="center">&nbsp;</td>
       <td width="86" align="left" bgcolor="#DDDDDD"><strong>Lan&ccedil;amento</strong></td>
       <td width="98" align="left" bgcolor="#DDDDDD"><strong>N&deg; Documento</strong></td>
       <td colspan="2" align="left" bgcolor="#DDDDDD"><strong>Hist&oacute;rico</strong></td>
       <td align="left" bgcolor="#DDDDDD"><strong>Entrada</strong></td>
       <td align="left" bgcolor="#DDDDDD"><strong>Sa&iacute;da</strong></td>
       <td align="center" bgcolor="#DDDDDD"><strong>Total</strong></td>
      </tr> 
      <%
      //Se ja tiver preenchido reinicializa o valor do contador
      ln = 2;
      }
      %>
  
  <%}else if(tipo.equals("P")){ %>
  
  <%
  //Subtrai valor ao total
  totalAtual -= rs01.getDouble("valor");
  //Formata o Valor
  total = formato.format(totalAtual);
  %>
  
  <tr bgcolor="<%=cor[j]%>">
   <td height="15" align="center"><font color="#666666" size="1"><%=(i+1)%></font></td>
   <td height="15" align="left"><%=dataLanc %></td>
   <td height="15" align="left"><%=rs01.getString("lancamentoID") %></td>
   <td height="15" colspan="2" align="left"><%=rs01.getString("favorecido") %></td>
   <td height="15" align="left"></td>
   <td height="15" align="left"><font color="#990000"><%=valor %></font></td>
   <td height="15" align="right">
   <%if(totalAtual <= 0){ %>
   <font color="#FF0000"><%=total %></font>
   <%}else{ %>
   <font color="#0000FF"><%=total %></font>
   <%} %>
   </td>
  </tr>
  
  <%ln++;%>
  <%
      //Verifica se ja preecheu as 54 linhas e da um espa�amento
      if(ln == 55){
      %>
      <tr>
       <td colspan="8" height="170" valign="bottom">
       
       <table width="585" border="0" align="center" cellpadding="0" cellspacing="0">
       <tr>
        <td colspan="4" height="32"></td>
       </tr>
       <tr>
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Iprimir Relatorio"></a></td>
        <td width="300" height="15" align="center"><font size="4"><strong><%=nomeFantasia %></strong></font></td>
        <td width="140" rowspan="5" align="center">&nbsp;</td>
       </tr>
       <tr>
        <td height="15" align="center"><strong><%=endereco %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=bairro %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=cidade %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=telefone %></strong></td>
        </tr>
       <tr>
        <td align="center" colspan="3"><hr></td>
       </tr>
       <tr>
        <td height="15" colspan="3" align="center"><strong>RELATORIO - LIVRO CAIXA - <%=rs.getString("banco") %> ( de <%=data.converteDeData(dataInicio) %>&nbsp;&nbsp; &agrave; &nbsp;&nbsp;<%=data.converteDeData(dataFim) %> )</strong>
        <%if(rs.getDouble("saldo")<=0){%>
         &nbsp;Saldo Atual: <font color="#FF0000"><%=saldo %></font>
        <%}else{%>
         &nbsp;Saldo Atual: <%=saldo %>
        <%}%>
        </td>
       </tr>
       <tr>
        <td align="center" colspan="3"><hr></td>
       </tr>
      </table>
       
       </td>
      </tr>
      <tr bgcolor="#DDDDDD">
       <td width="28" align="center">&nbsp;</td>
       <td width="86" align="left" bgcolor="#DDDDDD"><strong>Lan&ccedil;amento</strong></td>
       <td width="98" align="left" bgcolor="#DDDDDD"><strong>N&deg; Documento</strong></td>
       <td colspan="2" align="left" bgcolor="#DDDDDD"><strong>Hist&oacute;rico</strong></td>
       <td align="left" bgcolor="#DDDDDD"><strong>Entrada</strong></td>
       <td align="left" bgcolor="#DDDDDD"><strong>Sa&iacute;da</strong></td>
       <td align="center" bgcolor="#DDDDDD"><strong>Total</strong></td>
      </tr> 
      <%
      //Se ja tiver preenchido reinicializa o valor do contador
      ln = 2;
      }
      %>
  
  <%}else if(tipo.equals("D")){ %>
  
  <%
  //Soma valor ao total
  totalAtual += rs01.getDouble("valor");
  //Formata o Valor
  total = formato.format(totalAtual);
  %>
  
  <tr bgcolor="<%=cor[j]%>">
   <td height="15" align="center"><font color="#666666" size="1"><%=(i+1)%></font></td>
   <td height="15" align="left"><%=dataLanc %></td>
   <td height="15" align="left"><%=rs01.getString("lancamentoID") %></td>
   <td height="15" colspan="2" align="left">Transferencia Banc&aacute;ria</td>
   <td height="15" align="left"><font color="#009900"><%=valor %></font></td>
   <td height="15" align="left"></td>
   <td height="15" align="right">
   <%if(totalAtual <= 0){ %>
   <font color="#FF0000"><%=total %></font>
   <%}else{ %>
   <font color="#0000FF"><%=total %></font>
   <%} %>
   </td>
  </tr>
  
  <%ln++;%>
  <%
      //Verifica se ja preecheu as 54 linhas e da um espa�amento
      if(ln == 55){
      %>
      <tr>
       <td colspan="8" height="170" valign="bottom">
       
       <table width="585" border="0" align="center" cellpadding="0" cellspacing="0">
       <tr>
        <td colspan="4" height="32"></td>
       </tr>
       <tr>
        <td width="140" rowspan="5" align="left" valign="top"><a href="javascript: window.print() "><img src="images/logo_relatorio.png" border="0" title="Iprimir Relatorio"></a></td>
        <td width="300" height="15" align="center"><font size="4"><strong><%=nomeFantasia %></strong></font></td>
        <td width="140" rowspan="5" align="center">&nbsp;</td>
       </tr>
       <tr>
        <td height="15" align="center"><strong><%=endereco %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=bairro %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=cidade %></strong></td>
        </tr>
       <tr>
        <td height="15" align="center"><strong><%=telefone %></strong></td>
        </tr>
       <tr>
        <td align="center" colspan="3"><hr></td>
       </tr>
       <tr>
        <td height="15" colspan="3" align="center"><strong>RELATORIO - LIVRO CAIXA - <%=rs.getString("banco") %> ( de <%=data.converteDeData(dataInicio) %>&nbsp;&nbsp; &agrave; &nbsp;&nbsp;<%=data.converteDeData(dataFim) %> )</strong>
        <%if(rs.getDouble("saldo")<=0){%>
         &nbsp;Saldo Atual: <font color="#FF0000"><%=saldo %></font>
        <%}else{%>
         &nbsp;Saldo Atual: <%=saldo %>
        <%}%>
        </td>
       </tr>
       <tr>
        <td align="center" colspan="3"><hr></td>
       </tr>
      </table>
       
       </td>
      </tr>
      <tr bgcolor="#DDDDDD">
       <td width="28" align="center">&nbsp;</td>
       <td width="86" align="left" bgcolor="#DDDDDD"><strong>Lan&ccedil;amento</strong></td>
       <td width="98" align="left" bgcolor="#DDDDDD"><strong>N&deg; Documento</strong></td>
       <td colspan="2" align="left" bgcolor="#DDDDDD"><strong>Hist&oacute;rico</strong></td>
       <td align="left" bgcolor="#DDDDDD"><strong>Entrada</strong></td>
       <td align="left" bgcolor="#DDDDDD"><strong>Sa&iacute;da</strong></td>
       <td align="center" bgcolor="#DDDDDD"><strong>Total</strong></td>
      </tr> 
      <%
      //Se ja tiver preenchido reinicializa o valor do contador
      ln = 2;
      }
      %>
  
  <%}else if(tipo.equals("T")){ %>
  
  
  <%
  //Subtrai valor ao total
  totalAtual -= rs01.getDouble("valor");
  //Formata o Valor
  total = formato.format(totalAtual);
  %>
  
  <tr bgcolor="<%=cor[j]%>">
   <td height="15" align="center"><font color="#666666" size="1"><%=(i+1)%></font></td>
   <td height="15" align="left"><%=dataLanc %></td>
   <td height="15" align="left"><%=rs01.getString("lancamentoID") %></td>
   <td height="15" colspan="2" align="left">Transferencia Banc&aacute;ria</td>
   <td height="15" align="left"></td>
   <td height="15" align="left"><font color="#990000"><%=valor %></font></td>
   <td height="15" align="right">
   <%if(totalAtual <= 0){ %>
   <font color="#FF0000"><%=total %></font>
   <%}else{ %>
   <font color="#0000FF"><%=total %></font>
   <%} %>
   </td>
  </tr>
  <%ln++;%>
  
  <%} //Fim do if %>
  
  <%
  //Acrescenta valor do contador ( i )
  i++;
  %>
  
  <%} //Fim do while %>
       </table>
     <!-- ##########################     FIM DO RELATORIO ######################### -->
     
     </td>
    </tr>
   </table>
  <!-- Fim da Borda -->
  
  </td>
 </tr>
</table>
<!-- Fim da Primeira P�gina -->


</body>
<%} %>
</html>