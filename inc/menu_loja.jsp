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
 <td height="15" align="center" bgcolor="#CCCCCC">MENU LOJA DO SISTEMA - <strong><%=rs01.getString("unidade")%></strong></td>
<tr>
<%}%>
  <td align="center">
  
  <!--Menu Principal -->
  <table width="687" align="center">
   
   <tr>
    <td height="15"></td>
   </tr>
   <tr>
    <td width="109" align="center"><a href="sis_gerar_venda.jsp"><img src="ico/ico_pedido.png" alt="" width="60" height="60" border="0" title="Ponto de Venda" /></a></td>
    <td width="110" align="center"><a href="sis_abrir_caixa.jsp"><img src="ico/ico_caixa.png" alt="" width="60" height="60" border="0" title="Caixa" /></a></td>
    <td width="110" align="center"><a href="sis_view_produtos_separados.jsp"><img src="ico/ico_produto.png" alt="" width="60" height="60" border="0" title="Cadastrar Produtos" /></a></td>
    <td width="110" align="center"><a href="sis_view_fornecedores.jsp"><img src="ico/ico_fornecedores.png" alt="" width="60" height="60" border="0" title="Fornecedores" /></a></td>
    <td width="110" align="center"><a href="sis_vendas_fechadas.jsp"><img src="ico/ico_venda_ok.png" alt="" width="60" height="60" border="0" title="Vendas Concluidas" /></a></td>
    <td width="110" align="center"><a href="sis_view_orcamentos.jsp"><img src="ico/ico_orcamento.png" alt="" width="60" height="60" border="0" title="Or&ccedil;amentos" /></a></td>
	</tr>
   <tr>
    <td align="center">PDV</td>
    <td align="center">Caixa</td>
    <td align="center">Produtos</td>
    <td align="center">Fornecedores</td>
    <td align="center">Vendas</td>
    <td align="center">Or&ccedil;amentos</td>
    </tr>
   
    <tr>
    <td width="109" align="center">&nbsp;</td>
    <td width="110" align="center">&nbsp;</td>
    <td width="110" align="center">&nbsp;</td>
    <td width="110" align="center">&nbsp;</td>
    <td width="110" align="center">&nbsp;</td>
    <td width="110" align="center">&nbsp;</td>
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
    <td align="center"></td>
    <td align="center"></td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    </tr>
   <tr>
     <td align="center">&nbsp;</td>
     <td align="center">&nbsp;</td>
     <td align="center">&nbsp;</td>
     <td align="center">&nbsp;</td>
     <td align="center">&nbsp;</td>
     <td align="center">&nbsp;</td>
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