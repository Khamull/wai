<%@ page import="java.sql.*" %>

<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="usuario" class="cadastro.Usuario" scope="page"></jsp:useBean>

<%
//Recupera o ID do usuario que ir� ser excluido e adiciona ao Objeto
usuario.usuarioID = Integer.parseInt(request.getParameter("usuarioID"));

//chama o Metodo que ir� excluir esse usu�rio
st.execute(usuario.excluiUsuario());

//direciona para a p�gina que lista os usu�rios
response.sendRedirect("sis_view_usuarios.jsp?msg=3");
%>

<%
 //fecha a consulta
 st.close();
%>