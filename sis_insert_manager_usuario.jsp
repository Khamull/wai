<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>


<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>

<%
//Recupera valores trazidos do Formul�rio de Cadastro de Usu�rios
//Atrubui eles ao objeto usuario
usuario.nome = request.getParameter("nome");
usuario.login = request.getParameter("login");
usuario.senha = request.getParameter("senha");
usuario.nivel = request.getParameter("nivel");
%>

<%
//Verifica se j� existe um usu�rio com esse Nome
rs = st.executeQuery(usuario.verificaNome());

if(rs.next()){
	//Caso exista um Usu�rio com esse nome, retorna para a P�gina de Cadastro
	response.sendRedirect("sis_insert_usuario.jsp?msg=4");
}else{
	//Sen�o: Executa a Fun��o que ir� salvar os dados na Base de Dados
	st.execute(usuario.salvaUsuario());
	response.sendRedirect("sis_view_usuarios.jsp?msg=1");
}
%>

<%
 //fecha a consulta
 st.close();
 rs.close();
%>