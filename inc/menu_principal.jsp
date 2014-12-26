<jsp:useBean id="mensagens" class="acesso.Mensagens" scope="page"></jsp:useBean>

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

<table width="985" align="center" height="250">

<tr>
 <td height="15" align="center" bgcolor="#CCCCCC">MENU PRINCIPAL DO SISTEMA</td>
<tr>
  <td align="center">
  
  <!--Menu Principal -->
  <table width="800" align="center">
   <tr>
    <td width="266" align="center"><a href="sis_view_usuarios.jsp"><img src="ico/ico_usuarios.png" width="60" height="60" border="0" title="Usuários do Sistema" /></a></td>
    <td width="266" align="center"><a href="sis_update_empresa.jsp"><img src="ico/ico_empresa.png" width="60" height="60" border="0" title="Dados da Empresa" /></a></td>
    <td width="266" align="center"><a href="sis_view_funcionarios.jsp"><img src="ico/ico_funcionarios.png" width="60" height="60" border="0" title="Funcion&aacute;rios" /></a></td>
    
    </tr>
   <tr>
    <td align="center">Usu&aacute;rios</td>
    <td align="center">Empresa</td>
    <td align="center">Funcion&aacute;rios</td>
    </tr>
   <tr>
    <td height="15"></td>
   </tr>
   <tr>
    <td width="160" align="center"><a href="sis_view_clientes.jsp"><img src="ico/ico_clientes.png" width="60" height="60" border="0" title="Clientes" /></a></td>
    <td width="160" align="center"><a href="sis_view_livro_caixa.jsp"><img src="ico/ico_cofre.png" alt="" width="60" height="60" border="0" title="Livro Caixa" /></a></td>
    <td width="160" align="center"><a href="sis_conta_pagar.jsp"><img src="ico/ico_pagar.png" alt="" width="60" height="60" border="0" title="Contas a Pagar" /></a></td>
    
    <!-- td width="160" align="center"><a href="javascript: window.open('http://www2.varzeapaulista.sp.gov.br:8080/issweb/login/login.aspx','NFE','toolbar=no,fullscreen=yes,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,cop
history=yes,width = 880px; height = 600px')"><img src="ico/ico_nfe.png" alt="" width="60" height="60" border="0" title="Nota Fiscal Eletronica de Servico" /></a></td-->
     <td></td>
    </tr>
   <tr>
    <td align="center">Clientes</td>
    <td align="center">Livro Caixa</td>
    <td align="center">Pagar</td>
    
    <td align="center"></td>
    </tr>
   <tr>
     <td height="5" align="center">&nbsp;</td>
   </tr>
    <tr>
    <td width="160" align="center"><a href="sis_conta_receber.jsp"><img src="ico/ico_receber.png" alt="" width="60" height="60" border="0" title="Contas a Receber" /></a></td>
    <td width="160" align="center"><a href="sis_gerar_venda.jsp"><img src="ico/ico_pedido.png" width="60" height="60" border="0" title="Ponto de Venda" /></a></td>
    <td width="160" align="center"><a href="sis_abrir_caixa.jsp"><img src="ico/ico_caixa.png" alt="" width="60" height="60" border="0" title="Caixa" /></a></td>
    
    </tr>
   <tr>
    <td align="center">Receber</td>
    <td align="center">PDV</td>
    <td align="center">Caixa</td>
    
    
    </tr>
   <tr>
    <td height="15"></td>
   </tr>
   <tr>
    <td width="160" align="center"><a href="sis_view_produtos.jsp"><img src="ico/ico_produto.png" width="60" height="60" border="0" title="Cadastrar Produtos" /></a></td>
    <td width="160" align="center"><a href="sis_view_fornecedores.jsp"><img src="ico/ico_fornecedores.png" width="60" height="60" border="0" title="Fornecedores" /></td>
    <td align="center"><a href="sis_vendas_fechadas.jsp"><img src="ico/ico_venda_ok.png" alt="" width="60" height="60" border="0" title="Vendas Concluidas" /></a></td>
    </td>
    </tr>
   <tr>
     <td align="center">Produtos</td>
     <td align="center">Fornecedores</td>
     <td align="center">Vendas</td>
     
     </tr>
   <tr>
   	<td align="center"><a href="sis_view_orcamentos.jsp"><img src="ico/ico_orcamento.png" alt="" width="60" height="60" border="0" title="Or&ccedil;amentos" /></a></td>
    <td align="center"><a href="sis_view_relatorios.jsp"><img src="ico/ico_relatorios.png" alt="" width="60" height="60" border="0" title="Relat&oacute;rios" /></a></td>
    <td align="center"><a href="sis_menu.jsp?sair=ok"><img src="ico/ico_sair.png" alt="" width="60" height="60" border="0" title="Sair do Sistema" /></a><a href="#"></a>
   </td>
   <tr>
   	<td align="center">Or&ccedil;amentos</td>
     <td align="center">Relat&oacute;rios</td>
     <td align="center">Sair</td>
   </tr>
     <td height="5" align="center">&nbsp;</td>
   </tr>
   
   <%if(request.getParameter("msg") != null){%>
   <tr bgcolor="#FFFFCC">
    <td height="25" colspan="4" align="center" valign="middle"><strong><font color="#FF0000"><%=msg %></font></strong></td>
   </tr>
   <%} %>
  </table>
  <!--Fim Menu Principal-->
    
  </td>
</tr>
</table>