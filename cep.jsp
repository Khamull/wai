<%@ page contentType="text/html; charset=iso-8859-2" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Exemplo busca CEP Ajax</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<!-- Fa�a o include da lib do jQuery -->
<script type="text/javascript" src="js/cep.js"></script>
<script type="text/javascript">
	// Fun��o �nica que far� a transa��o
	function getEndereco() {
			// Se o campo CEP n�o estiver vazio
			if($.trim($("#cep").val()) != ""){
				/* 
					Para conectar no servi�o e executar o json, precisamos usar a fun��o
					getScript do jQuery, o getScript e o dataType:"jsonp" conseguem fazer o cross-domain, os outros
					dataTypes n�o possibilitam esta intera��o entre dom�nios diferentes
					Estou chamando a url do servi�o passando o par�metro "formato=javascript" e o CEP digitado no formul�rio
					http://cep.republicavirtual.com.br/web_cep.php?formato=javascript&cep="+$("#cep").val()
				*/
				$.getScript("http://cep.republicavirtual.com.br/web_cep.php?formato=javascript&cep="+$("#cep").val(), function(){
					// o getScript d� um eval no script, ent�o � s� ler!
					//Se o resultado for igual a 1
			  		if(resultadoCEP["resultado"]){
						// troca o valor dos elementos
						$("#rua").val(unescape(resultadoCEP["tipo_logradouro"])+": "+unescape(resultadoCEP["logradouro"]));
						$("#bairro").val(unescape(resultadoCEP["bairro"]));
						$("#cidade").val(unescape(resultadoCEP["cidade"]));
						$("#estado").val(unescape(resultadoCEP["uf"]));
					}else{
						alert("Endere�o n�o encontrado");
					}
				});				
			}			
	}
</script>

</head>

<body>


<!-- 
	O formul�rio � simples, a �nica coisa diferente � o atributo "onBlur" no campo "cep" 
    o onBlur executa um comando javascript assim que o campo perde o f�co, neste caso eu chamo a fun��o javascript "getEndereco()"
 -->
<form>
  <fieldset>
  <legend>Formul�rio de exemplo</legend>
  <label for="cep">CEP:</label>
  <input name="cep" id="cep" size="9" maxlength="8" onBlur="getEndereco()"/>
  <br />
  <label for="rua">Logadouro:</label>
  <input name="rua" id="rua" size="50"/>
  <br/>
  <label for="bairro">Bairro:</label>
  <input name="bairro" id="bairro" size="30"/>
  <br/>
  <label for="cidade">Cidade:</label>
  <input name="cidade" id="cidade"/>
  <br/>
  <label for="estado">Estado</label>
  <input name="estado" id="estado" size="2" maxlength="2"/>
  <br/>
  <input type="button" value="Ok" class="button">
  </fieldset>
</form>
</body>
</html>