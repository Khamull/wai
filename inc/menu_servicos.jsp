<%@ page import="java.sql.*" %>
<%@ include file="../inc/conexao.jsp" %>

<jsp:useBean id="mensagens" class="acesso.Mensagens" scope="page"></jsp:useBean>

<jsp:useBean id="empresa" class="cadastro.Empresa" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo Statement para ajudar na query
Statement st01 = con.createStatement();
%>

<%
//Instancia um objeto do tipo ResultSet para receber o resultado de uma consulta
ResultSet rs01 = null;
%>

<%
//Atribui o objeto salvo na sessao ao objeto empresa
empresa.empresaID = Integer.parseInt((String)session.getAttribute("empresaID"));
//Pesquisa a Unidade que está logada de acordo com a variavel que foi salva na sessao
rs01 = st01.executeQuery(empresa.dadosGerais());
%>


<%
//Trata mensagens
//variaveis que serão utilizadas para verificação
String msg = "";
int numeroMsg;
//verifica se foi passado alguma mensagem via URL
if(request.getParameter("msg") != null){
	numeroMsg = Integer.parseInt(request.getParameter("msg"));
	msg = mensagens.mensagem(numeroMsg);
}
%>

<table width="985" align="center" height="440">
<%if(rs01.next()){%>
<tr>
 <td height="15" align="center" bgcolor="#CCCCCC">MENU SERVI&Ccedil;OS DO SISTEMA - <strong><%=rs01.getString("unidade")%></strong></td>
<tr>
<%}%>
  <td align="center">
  
  <!--Menu Principal -->
  <table width="899" align="center">
   <tr>
    <td width="160" align="center"><a href="sis_insert_orcamento_servico.jsp"><img src="ico/ico_orcamentos.png" width="60" height="60" border="0" title="Orçamentos" /></a></td>
    <td width="160" align="center"><a href="sis_view_contratos.jsp"><img src="ico/ico_contrato.png" alt="" width="60" height="60" border="0" title="Contratos" /></a></td>
    <td width="160" align="center"><a href="sis_view_servicos.jsp"><img src="ico/ico_servicos.png" width="60" height="60" border="0" title="Serviços" /></a></td>
    <td width="160" align="center"><a href="sis_update_parametros.jsp"><img src="ico/ico_engrenagem.jpg" alt="" width="60" height="60" border="0" title="Par&acirc;metros" /></a></td>
    <td width="160" align="center"><a href="sis_view_modelo_contrato.jsp"><img src="ico/ico_modelo_contrato.jpg" alt="" width="60" height="60" border="0" title="Modelo do Contrato" /></a></td>
    <td width="160" align="center"><a href="sis_upload_arquivos.jsp"><img src="ico/ico_upload.png" alt="" width="60" height="60" border="0" title="Upload de Arquivos" /></a></td>
    </tr>
   <tr>
    <td align="center">Or&ccedil;amentos</td>
    <td align="center">Contratos</td>
    <td align="center">Servi&ccedil;os</td>
    <td align="center">Par&acirc;metros</td>
    <td align="center">Modelo Contrato</td>
    <td align="center">Upload de Arquivos</td>
    </tr>
   <tr>
    <td height="15"></td>
   </tr>
   <tr>
	<td width="160" align="center">&nbsp;</td>
    <td width="160" align="center">&nbsp;</td>
    <td width="160" align="center">&nbsp;</td>
    <td width="160" align="center">&nbsp;</td>
    <td width="160" align="center">&nbsp;</td>
    <td width="160" align="center">&nbsp;</td>
    </tr>
   <tr>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    </tr>
   <tr>
     <td height="5" align="center">&nbsp;</td>
   </tr>
    <tr>
    <td width="160" align="center">&nbsp;</td>
    <td width="160" align="center">&nbsp;</td>
    <td width="160" align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center"><a href="sis_menu.jsp?sair=ok"></a><a href="#"></a></td>
    </tr>
   <tr>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    </tr>
   <tr>
    <td height="15"></td>
   </tr>
   

   <%if(request.getParameter("msg") != null){%>
   <tr bgcolor="#FFFFCC">
    <td height="25" colspan="6" align="center" valign="middle"><strong><font color="#FF0000"><%=msg %></font></strong></td>
   </tr>
   <%} %>
  </table>
  <!--Fim Menu Principal-->
    
  </td>
</tr>
</table>