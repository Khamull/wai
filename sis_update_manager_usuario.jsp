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
usuario.usuarioID = Integer.parseInt(request.getParameter("usuarioID"));
usuario.nome = request.getParameter("nome");
usuario.login = request.getParameter("login");
usuario.senha = request.getParameter("senha");
usuario.nivel = request.getParameter("nivel");
%>

<%
//Verifica se j� existe um usu�rio com esse Nome
rs = st.executeQuery(usuario.verificaNomeAlterar());

if(rs.next()){
	//Caso exista um Usu�rio com esse nome, retorna para a P�gina de Cadastro
	response.sendRedirect("sis_update_usuario.jsp?msg=5&usuarioID="+usuario.usuarioID);
}else{
	//Sen�o: Executa a Fun��o que ir� Alterar os dados na Base de Dados
	st.execute(usuario.editarUsuario());
	response.sendRedirect("sis_view_usuarios.jsp?msg=2");
}
%>


<%
 //fecha a consulta
 st.close();
%>