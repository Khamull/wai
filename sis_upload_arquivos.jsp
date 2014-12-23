<%//@ page errorPage="index.jsp?erro=3" %>
<%@ page import="java.sql.*" %>
<%@ include file="inc/seguranca.jsp" %>
<%@ include file="inc/conexao.jsp" %>


<%@ page language="java" import="javazoom.upload.*,java.util.*" %>
<%//@ page errorPage="ExceptionHandler.jsp" %>

<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
  <jsp:setProperty name="upBean" property="folderstore" value="/home/fortesystem/webapps/engmarcia/download" />
</jsp:useBean>


<jsp:useBean id="cliente" class="cadastro.Cliente" scope="page"></jsp:useBean>

<jsp:useBean id="download" class="servico.Download" scope="page"></jsp:useBean>




<%
	String msg = "";

      if (MultipartFormDataRequest.isMultipartFormData(request))
      {
         // Usa MultipartFormDataRequest para Converter o HTTP request.
         MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
         String todo = null;
         if (mrequest != null) todo = mrequest.getParameter("todo");
	     if ( (todo != null) && (todo.equalsIgnoreCase("upload")) )
	     {
                Hashtable files = mrequest.getFiles();
                if ( (files != null) && (!files.isEmpty()) )
                {
                    UploadFile file = (UploadFile) files.get("arquivo");
                    
                    //if (file != null) out.println("<li>Form field : uploadfile"+"<BR> Uploaded file : "+file.getFileName()+" ("+file.getFileSize()+" bytes)"+"<BR> Content Type : "+file.getContentType());
                    
                    // Usa o bean para alocar os dados no diretorio especificado em jsp:setProperty que está no topo.
                    upBean.store(mrequest, "arquivo");
					
					
					//Imprime a mensagem na tela
					msg = "Arquivo "+file.getFileName()+" Salvo com Sucesso!";
					
					download.cliente.clienteID = Integer.parseInt(mrequest.getParameter("clienteID"));
					download.titulo = mrequest.getParameter("titulo");
					download.contrato = mrequest.getParameter("contrato");
					download.arquivo = file.getFileName();
	
					//Salva na base de dados as informações do arquivo que foi feito o Upload
					st.execute(download.insereDownload());
                }
                else
                {
                  out.println("Erro ao tentar Salvar o arquivo!");
                }
	     }
         else out.println("<BR> todo="+todo);
      }
%>


<%
////Salva na base de Dados
//if(msg != ""){
//	
//	//Atribui os valores ao objeto download
//	//download.cliente.clienteID = Integer.parseInt(request.getParameter("clienteID"));
//	download.titulo = request.getParameter("titulo");
//	download.contrato = request.getParameter("contrato");
//	download.arquivo = request.getParameter("arquivo");
//	
//	//Salva na base de dados as informações do arquivo que foi feito o Upload
//	st.execute(download.insereDownload());
//	
//	//out.println("salvou!");
//}
//
%>



<%
//Instancia um objeto do tipo Statement para ajudar na query
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
//Pesquisa todos os cliente Ativos
rs01 = st01.executeQuery(cliente.listaClientesaAtivos());
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2" />
<title>FORTE SYSTEM</title>

<script type="text/javascript">
function verForm(){
	
	if(document.upform.clienteID.value==""){
		alert("Favor selecionar um Cliente!");
		document.upform.clienteID.focus();
		return false;
	}
	
	if(document.upform.contrato.value==""){
		alert("Favor Informar o numero do Contrato!");
		document.upform.contrato.focus();
		return false;
	}
	
	if(document.upform.arquivo.value==""){
		alert("Favor selecionar um arquivo para fazer UPLOAD!");
		document.upform.arquivo.focus();
		return false;
	}
	
	if(document.upform.titulo.value==""){
		alert("Favor informe um Titulo para esse Arquivo!");
		document.upform.titulo.focus();
		return false;
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
 <input type="button" class="botao" onclick="javascript: window.location.href='sis_download_arquivos.jsp'" value="Download dos Arquivos" />
 </td>
</tr>
<tr>
 <td height="25"></td>
</tr>
<tr>
 <td valign="top" align="center">
 
<form method="post" action="sis_upload_arquivos.jsp" name="upform" enctype="multipart/form-data" onsubmit="return verForm(this)" >
 <table width="400" align="center" cellpadding="4" cellspacing="4" style="border:1px solid #444444">
  <tr bgcolor="#EEEEEE">
   <td colspan="2" align="center"><strong>UPLOAD DE ARQUIVOS</strong></td>
  </tr>
  <tr>
   <td width="125" align="left">Cliente</td>
   <td width="245" align="left">
   <select id="clienteID" name="clienteID">
    <option value="">Selecione...</option>
    <%while(rs01.next()){ %>
     <option value="<%=rs01.getString("clienteID") %>"><%=rs01.getString("clienteNomeFantasia") %></option>
    <%} %>
   </select>   </td>
  </tr>
  <tr>
   <td align="left">N&deg; Contrato</td>
   <td align="left"><input type="text" id="contrato" name="contrato" maxlength="10" size="20" /></td>
  </tr>
  <tr>
   <td align="left">Arquivo</td>
   <td align="left"><input id="arquivo" name="arquivo" type="file" size="26" maxlength="50" /></td>
  </tr>
  <tr>
    <td align="left">T&iacute;tulo do Arquivo</td>
    <td align="left"><input type="text" id="titulo" name="titulo" size="40" maxlength="50" /></td>
  </tr>
  <tr>
    <td align="left"><input name="Submit" type="submit" class="botao" value="Enviar" /></td>
    <td align="left"><input type="hidden" name="todo" value="upload" /></td>
  </tr>
  <tr>
    <td colspan="2" align="center"><font color="#FF0000"><strong><%=msg%></strong></font></td>
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