<%@ page import="java.sql.*" %>
<%@ include file="inc/conexao.jsp" %>

<jsp:useBean id="cargo" class="cadastro.Cargo" scope="page"></jsp:useBean>
<jsp:useBean id="endereco" class="servico.EnderecoEntrega" scope="page"></jsp:useBean>

<%
//Instancia um objeto do tipo ResultSet para receber resultado de uma Consulta
ResultSet rs = null;
%>


<%
//Recupera valores trazidos do Formulário de Cadastro de Endereco
//Atrubui eles ao objeto endereco
endereco.servico.servicoID = Integer.parseInt(request.getParameter("servicoID"));
endereco.logradouro = request.getParameter("rua");
endereco.numero = request.getParameter("numero");
endereco.complemento = request.getParameter("complemento");
endereco.bairro = request.getParameter("bairro");
endereco.cidade = request.getParameter("cidade");
endereco.uf = request.getParameter("uf");
endereco.cep = request.getParameter("cep");

%>

<%
//Altera as informações do Endereço
st.execute(endereco.alteraEndereco());

response.sendRedirect("sis_endereco_obra.jsp?msg=1&servicoID="+endereco.servico.servicoID);
%>


<%
 //fecha a consulta
 st.close();
%>