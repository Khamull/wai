<%
//Verifica se est� logado
if(session.getAttribute("usuario") == null){
	//Destroi a Sess�o
	session.invalidate();
	response.sendRedirect("../index.jsp?erro=3");
}

//Faz logoff do Sistema
if(request.getParameter("sair") != null){
	//Destroi a Sess�o
	session.invalidate();
	response.sendRedirect("../index.jsp");
}
%>