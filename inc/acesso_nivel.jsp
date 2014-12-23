
<%
//   ###### LEIA ATENTAMENTE ######
//
//Essa p�gina em jsp tem um conte�do muito extenso e por isso foi dividido em blocos;
//Cada bloco Filtra Niveis diferentes de Usu�rio
//Para facilitar a Busca na hora da Manuten��o:
	// - Selecione o seguinte caracter:  �
	// - Aperte ( Ctrl + F );

//Cada Find que voc� clicar ir� para o pr�ximo bloco
//
//   ###############################
%>








<%
//Variavel que recebe o valor da URL TOTAL
String urlTotal = String.valueOf(request.getRequestURL());

//Variavel que recebe o nivel do Usu�rio
String nivelUsuario = String.valueOf(session.getAttribute("nivel"));;

//Quebra a URL em peda�os em um Split por ( / )
String[] urlQuebrada  = urlTotal.split("/");

//Verifica qual o ultimo parametro da URL e atribui ele � variavel urlCaminho
int tamanho = urlQuebrada.length;

String urlCaminho = urlQuebrada[tamanho-1];










//############ � Trata Nivel 2 de Usu�rio #########################################

//Bloqueia visualizar todos os livros caixa
if(urlCaminho.equals("sis_view_livro_caixa.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}
//Bloqueia Alterar informa��es do Livro caixa
if(urlCaminho.equals("sis_update_livro_caixa.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Cria��o de novos bancos
if(urlCaminho.equals("sis_insert_livro_caixa.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Transferencia
if(urlCaminho.equals("sis_traferencia.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de novas contas a pagar
if(urlCaminho.equals("sis_insert_conta_pagar.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o Pagamento da Conta
if(urlCaminho.equals("sis_insert_pagamento.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a altera��o de uma conta � Pagar
if(urlCaminho.equals("sis_update_conta_pagar.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o das contas � Pagar
if(urlCaminho.equals("sis_conta_pagar.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o dos cheques que voltaram
if(urlCaminho.equals("sis_view_cheques_voltaram.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o Cadastro de cheques que voltaram
if(urlCaminho.equals("sis_cheques_voltaram.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a altera��o de uma conta � Receber
if(urlCaminho.equals("sis_update_conta_receber.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o recebimento de uma Conta
if(urlCaminho.equals("sis_insert_recebimento.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Visualiza��o das Contas � Receber
if(urlCaminho.equals("sis_conta_receber.jsp") && nivelUsuario.equals("2")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}











//############ � Trata Nivel 3 de Usu�rio #########################################

//Bloqueia a visualiza��o dos dados da Empresa
if(urlCaminho.equals("sis_update_empresa.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o dos cargos existentes no sistema
if(urlCaminho.equals("sis_view_cargos.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de novos cargos 
if(urlCaminho.equals("sis_insert_cargo.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a altera��o dos cargos
if(urlCaminho.equals("sis_update_cargo.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o Cadastro de novos funcionarios
if(urlCaminho.equals("sis_insert_funcionario.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o um funcionario
if(urlCaminho.equals("sis_detalhe_funcionario.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a altera��o dos usu�rios
if(urlCaminho.equals("sis_update_funcionario.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o de todos os funcionarios
if(urlCaminho.equals("sis_view_funcionarios.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de Produtos
if(urlCaminho.equals("sis_insert_produto.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de tipos de Produto
if(urlCaminho.equals("sis_insert_tipo.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o dos tipos de Produto
if(urlCaminho.equals("sis_view_tipos.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Alimenta��o de Estoque
if(urlCaminho.equals("sis_insert_estoque.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a altera��o de Produto
if(urlCaminho.equals("sis_update_produto.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o de Retiradas dos Produtos
if(urlCaminho.equals("sis_view_retiradas_estoque.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Retirada de Produto do estoque
if(urlCaminho.equals("sis_insert_retirada_estoque.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Visualiza��o de um Fornecedor
if(urlCaminho.equals("sis_detalhe_fornecedor.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a altera��o de um Fornecedor
if(urlCaminho.equals("sis_update_fornecedor.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de um novo Fornecedor
if(urlCaminho.equals("sis_insert_fornecedor.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o de todos os Fornecedores
if(urlCaminho.equals("sis_view_fornecedores.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia visualizar todos os livros caixa
if(urlCaminho.equals("sis_view_livro_caixa.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}
//Bloqueia Alterar informa��es do Livro caixa
if(urlCaminho.equals("sis_update_livro_caixa.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Cria��o de novos bancos
if(urlCaminho.equals("sis_insert_livro_caixa.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o da Receita de um Livro Caixa
if(urlCaminho.equals("sis_resumo.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Transferencia
if(urlCaminho.equals("sis_traferencia.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de novas contas a pagar
if(urlCaminho.equals("sis_insert_conta_pagar.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o Pagamento da Conta
if(urlCaminho.equals("sis_insert_pagamento.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a altera��o de uma conta � Pagar
if(urlCaminho.equals("sis_update_conta_pagar.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o das contas � Pagar
if(urlCaminho.equals("sis_conta_pagar.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o dos cheques que voltaram
if(urlCaminho.equals("sis_view_cheques_voltaram.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o Cadastro de cheques que voltaram
if(urlCaminho.equals("sis_cheques_voltaram.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a altera��o de uma conta � Receber
if(urlCaminho.equals("sis_update_conta_receber.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o recebimento de uma Conta
if(urlCaminho.equals("sis_insert_recebimento.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Visualiza��o das Contas � Receber
if(urlCaminho.equals("sis_conta_receber.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Visualiza��o de todos os Relat�rios
if(urlCaminho.equals("sis_view_relatorios.jsp") && nivelUsuario.equals("3")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}








//############ � Trata Nivel 4 de Usu�rio #########################################

//Bloqueia a visualiza��o dos dados da Empresa
if(urlCaminho.equals("sis_update_empresa.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o dos cargos existentes no sistema
if(urlCaminho.equals("sis_view_cargos.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de novos cargos 
if(urlCaminho.equals("sis_insert_cargo.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a altera��o dos cargos
if(urlCaminho.equals("sis_update_cargo.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o Cadastro de novos funcionarios
if(urlCaminho.equals("sis_insert_funcionario.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o um funcionario
if(urlCaminho.equals("sis_detalhe_funcionario.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a altera��o dos usu�rios
if(urlCaminho.equals("sis_update_funcionario.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o de todos os funcionarios
if(urlCaminho.equals("sis_view_funcionarios.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}


//Bloqueia o cadastro de Produtos
if(urlCaminho.equals("sis_insert_produto.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de tipos de Produto
if(urlCaminho.equals("sis_insert_tipo.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o dos tipos de Produto
if(urlCaminho.equals("sis_view_tipos.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Alimenta��o de Estoque
if(urlCaminho.equals("sis_insert_estoque.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a altera��o de Produto
if(urlCaminho.equals("sis_update_produto.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o de Retiradas dos Produtos
if(urlCaminho.equals("sis_view_retiradas_estoque.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Retirada de Produto do estoque
if(urlCaminho.equals("sis_insert_retirada_estoque.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Visualiza��o de um Fornecedor
if(urlCaminho.equals("sis_detalhe_fornecedor.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a altera��o de um Fornecedor
if(urlCaminho.equals("sis_update_fornecedor.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de um novo Fornecedor
if(urlCaminho.equals("sis_insert_fornecedor.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o de todos os Fornecedores
if(urlCaminho.equals("sis_view_fornecedores.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o de retiradas do caixa
if(urlCaminho.equals("sis_view_retiradas.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o de todos os fechamentos
if(urlCaminho.equals("sis_view_fechamentos.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a abertura de caixa
if(urlCaminho.equals("sis_abrir_caixa.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia visualizar todos os livros caixa
if(urlCaminho.equals("sis_view_livro_caixa.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}
//Bloqueia Alterar informa��es do Livro caixa
if(urlCaminho.equals("sis_update_livro_caixa.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Cria��o de novos bancos
if(urlCaminho.equals("sis_insert_livro_caixa.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o da Receita de um Livro Caixa
if(urlCaminho.equals("sis_resumo.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Transferencia
if(urlCaminho.equals("sis_traferencia.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de novas contas a pagar
if(urlCaminho.equals("sis_insert_conta_pagar.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o Pagamento da Conta
if(urlCaminho.equals("sis_insert_pagamento.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a altera��o de uma conta � Pagar
if(urlCaminho.equals("sis_update_conta_pagar.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o das contas � Pagar
if(urlCaminho.equals("sis_conta_pagar.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o dos cheques que voltaram
if(urlCaminho.equals("sis_view_cheques_voltaram.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o Cadastro de cheques que voltaram
if(urlCaminho.equals("sis_cheques_voltaram.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a altera��o de uma conta � Receber
if(urlCaminho.equals("sis_update_conta_receber.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o recebimento de uma Conta
if(urlCaminho.equals("sis_insert_recebimento.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Visualiza��o das Contas � Receber
if(urlCaminho.equals("sis_conta_receber.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Visualiza��o de todos os Relat�rios
if(urlCaminho.equals("sis_view_relatorios.jsp") && nivelUsuario.equals("4")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}









//############ � Trata Nivel 5 de Usu�rio #########################################

//Bloqueia a visualiza��o dos dados da Empresa
if(urlCaminho.equals("sis_update_empresa.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o dos cargos existentes no sistema
if(urlCaminho.equals("sis_view_cargos.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de novos cargos 
if(urlCaminho.equals("sis_insert_cargo.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a altera��o dos cargos
if(urlCaminho.equals("sis_update_cargo.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o Cadastro de novos funcionarios
if(urlCaminho.equals("sis_insert_funcionario.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o um funcionario
if(urlCaminho.equals("sis_detalhe_funcionario.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a altera��o dos usu�rios
if(urlCaminho.equals("sis_update_funcionario.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o de todos os funcionarios
if(urlCaminho.equals("sis_view_funcionarios.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a altera��o de Cliente
if(urlCaminho.equals("sis_update_cliente.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de Produtos
if(urlCaminho.equals("sis_insert_produto.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de tipos de Produto
if(urlCaminho.equals("sis_insert_tipo.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o dos tipos de Produto
if(urlCaminho.equals("sis_view_tipos.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Alimenta��o de Estoque
if(urlCaminho.equals("sis_insert_estoque.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a altera��o de Produto
if(urlCaminho.equals("sis_update_produto.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o de Retiradas dos Produtos
if(urlCaminho.equals("sis_view_retiradas_estoque.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Retirada de Produto do estoque
if(urlCaminho.equals("sis_insert_retirada_estoque.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}


//Bloqueia o cadastro de um novo Fornecedor
if(urlCaminho.equals("sis_insert_fornecedor.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o de retiradas do caixa
if(urlCaminho.equals("sis_view_retiradas.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o de todos os fechamentos
if(urlCaminho.equals("sis_view_fechamentos.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a abertura de caixa
if(urlCaminho.equals("sis_abrir_caixa.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia gerar novo or�amento
if(urlCaminho.equals("sis_insert_orcamento.jsp") && nivelUsuario.equals("5")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}











//############ � Trata Nivel 6 de Usu�rio #########################################

//Bloqueia a visualiza��o dos dados da Empresa
if(urlCaminho.equals("sis_update_empresa.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o dos cargos existentes no sistema
if(urlCaminho.equals("sis_view_cargos.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de novos cargos 
if(urlCaminho.equals("sis_insert_cargo.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a altera��o dos cargos
if(urlCaminho.equals("sis_update_cargo.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o Cadastro de novos funcionarios
if(urlCaminho.equals("sis_insert_funcionario.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o um funcionario
if(urlCaminho.equals("sis_detalhe_funcionario.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a altera��o dos usu�rios
if(urlCaminho.equals("sis_update_funcionario.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o de todos os funcionarios
if(urlCaminho.equals("sis_view_funcionarios.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a altera��o de Cliente
if(urlCaminho.equals("sis_update_cliente.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o de divida por Cliente
if(urlCaminho.equals("sis_divida_cliente.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o Cadastro de novos clientes
if(urlCaminho.equals("sis_insert_cliente.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o de um cliente
if(urlCaminho.equals("sis_detalhe_cliente.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o de todos os clientes
if(urlCaminho.equals("sis_view_clientes.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o de retiradas do caixa
if(urlCaminho.equals("sis_view_retiradas.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o de todos os fechamentos
if(urlCaminho.equals("sis_view_fechamentos.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a abertura de caixa
if(urlCaminho.equals("sis_abrir_caixa.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia visualizar todos os livros caixa
if(urlCaminho.equals("sis_view_livro_caixa.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}
//Bloqueia Alterar informa��es do Livro caixa
if(urlCaminho.equals("sis_update_livro_caixa.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Cria��o de novos bancos
if(urlCaminho.equals("sis_insert_livro_caixa.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o da Receita de um Livro Caixa
if(urlCaminho.equals("sis_resumo.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Transferencia
if(urlCaminho.equals("sis_traferencia.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o cadastro de novas contas a pagar
if(urlCaminho.equals("sis_insert_conta_pagar.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o Pagamento da Conta
if(urlCaminho.equals("sis_insert_pagamento.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a altera��o de uma conta � Pagar
if(urlCaminho.equals("sis_update_conta_pagar.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o das contas � Pagar
if(urlCaminho.equals("sis_conta_pagar.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o dos cheques que voltaram
if(urlCaminho.equals("sis_view_cheques_voltaram.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o Cadastro de cheques que voltaram
if(urlCaminho.equals("sis_cheques_voltaram.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a altera��o de uma conta � Receber
if(urlCaminho.equals("sis_update_conta_receber.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia o recebimento de uma Conta
if(urlCaminho.equals("sis_insert_recebimento.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a Visualiza��o das Contas � Receber
if(urlCaminho.equals("sis_conta_receber.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o das vendas fechadas
if(urlCaminho.equals("sis_vendas_fechadas.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}


//Bloqueia a gera��o de novos or�amentos
if(urlCaminho.equals("sis_insert_orcamento.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}

//Bloqueia a visualiza��o de todos os or�amentos fechados
if(urlCaminho.equals("sis_view_orcamentos.jsp") && nivelUsuario.equals("6")){
	response.sendRedirect("sis_menu.jsp?msg=2");
}



//out.println(urlCaminho);
%>