<%
Connection con = null;
Statement st = null;

//CONEXAO PARA HOSPEDAGEM
Class.forName("org.gjt.mm.mysql.Driver");
con = DriverManager.getConnection("jdbc:mysql://mysql.fortesystem.net.br/fortesystem19", "fortesystem19", "100awaif");
st=con.createStatement();


//CONEXAO PARA PC-ALMIR
//Class.forName("org.gjt.mm.mysql.Driver");
//con=DriverManager.getConnection("jdbc:mysql://localhost/sobavi","root","");
//st=con.createStatement();

%>