<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="funcionario" class="cadastro.Funcionario" scope="page"></jsp:useBean>

<jsp:useBean id="formatar" class="formatar.Datas" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>

<%
//Recupera valores trazidos do Formul�rio de Cadastro de Funcionarios
//Atrubui eles ao objeto funcionario
funcionario.nome 					= request.getParameter("funcionarioNome");
funcionario.cargo 					= request.getParameter("cargoID");
funcionario.nascimento 				= request.getParameter("funcionarioNascimento");
funcionario.rg 						= request.getParameter("funcionarioRg");
funcionario.cpf 					= request.getParameter("funcionarioCpf");
funcionario.endereco.logradouro 	= request.getParameter("rua");
funcionario.endereco.numero 		= request.getParameter("funcionarioNumero");
funcionario.endereco.bairro 		= request.getParameter("bairro");
funcionario.endereco.cep 			= request.getParameter("cep");
funcionario.endereco.cidade 		= request.getParameter("cidade");
funcionario.endereco.uf 			= request.getParameter("funcionarioUf");
funcionario.endereco.complemento 	= request.getParameter("funcionarioComplemento");
funcionario.telefone 				= request.getParameter("funcionarioTelefone");
funcionario.celular 				= request.getParameter("funcionarioCelular");
funcionario.operadoraCelular 		= request.getParameter("operadoraCelular");
funcionario.email 					= request.getParameter("funcionarioEmail");
funcionario.funcionarioUsuario 		= request.getParameter("funcionarioUsuario");

//Chama o M�todo para formatar a Data que foi passada
funcionario.nascimento = formatar.converteParaData(funcionario.nascimento);
%>

<%
//Verifica se j� existe um funcionario com esse CPF
rs = st.executeQuery(funcionario.verificaCpf());

if(rs.next()){
	//Caso exista um Funcionario com esse CPF, retorna para a P�gina de Cadastro
	response.sendRedirect("sis_insert_funcionario.jsp?msg=4");
}else{
	//Sen�o: Executa a Fun��o que ir� salvar os dados na Base de Dados
	st.execute(funcionario.salvarFuncionario());
	response.sendRedirect("sis_view_funcionarios.jsp?msg=1");
}
%>

<%
 //fecha a consulta
 st.close();
 rs.close();
%>