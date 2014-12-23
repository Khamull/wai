<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="cliente" class="cadastro.Cliente" scope="page"></jsp:useBean>


<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>

<%
//Recupera valores trazidos do Formul�rio de Cadastro de Clientes
//Atrubui eles ao objeto cliente

cliente.tipoPessoa				= request.getParameter("tipoCliente");
cliente.nomeFantasia 			= request.getParameter("clienteNomeFantasia");
cliente.razaoSocial 			= request.getParameter("clienteRazaoSocial");
cliente.cnpj 					= request.getParameter("clienteCnpj");
cliente.inscEstadual 			= request.getParameter("clienteInscEstadual");
cliente.inscMunicipal 			= request.getParameter("clienteInscMunicipal");
cliente.endereco.logradouro		= request.getParameter("rua");
cliente.endereco.numero 		= request.getParameter("clienteNumero");
cliente.endereco.bairro 		= request.getParameter("bairro");
cliente.endereco.cep 			= request.getParameter("cep");
cliente.endereco.cidade 		= request.getParameter("cidade");
cliente.endereco.uf 			= request.getParameter("clienteUf");
cliente.endereco.complemento 	= request.getParameter("clienteComplemento");
cliente.contato 				= request.getParameter("clienteContato");
cliente.telefone 				= request.getParameter("clienteTelefone");
cliente.fax 					= request.getParameter("clienteFax");
cliente.radio 					= request.getParameter("clienteRadio");
cliente.celular 				= request.getParameter("clienteCelular");
cliente.operadoraCelular 		= request.getParameter("operadoraCelular");
cliente.email 					= request.getParameter("clienteEmail");
cliente.site 					= request.getParameter("clienteSite");
cliente.limiteCredito 			= request.getParameter("limiteCredito");
cliente.usuario.nome			= request.getParameter("clienteUsuario");

//Valida se � CNPJ ou CPF
if(cliente.cnpj.equals("")){
	cliente.cnpj = request.getParameter("clienteCpf");
}
%>

<%
//Verifica se j� existe um usu�rio com esse Nome
rs = st.executeQuery(cliente.verificaCnpj());

if(rs.next()){
	//Caso exista um Cliente com esse CPF / CNPJ, retorna para a P�gina de Cadastro
	response.sendRedirect("sis_insert_cliente.jsp?msg=4");
}else{
	//Sen�o: Executa a Fun��o que ir� salvar os dados na Base de Dados
	st.execute(cliente.salvarCliente());
	response.sendRedirect("sis_view_clientes.jsp?msg=1");
}
%>

<%
 //fecha a consulta
 st.close();
 rs.close();
%>