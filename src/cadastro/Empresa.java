// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   Empresa.java

package cadastro;


public class Empresa
{

    public Empresa()
    {
    }

    public String dadosEmpresa()
    {
        return "SELECT * FROM empresa ORDER BY empresaID DESC LIMIT 1";
    }

    public String alterarEmpresa()
    {
        String altEmpresa = (new StringBuilder("UPDATE empresa SET nomeFantasia = '")).append(nomeFantasia).append("', razaoSocial = '").append(razaoSocial).append("', ramo = '").append(ramo).append("', ").toString();
        altEmpresa = (new StringBuilder(String.valueOf(altEmpresa))).append("cnpj = '").append(cnpj).append("', inscEstadual = '").append(inscEstadual).append("', inscMunicipal = '").append(inscMunicipal).append("', cep = '").append(cep).append("', ").toString();
        altEmpresa = (new StringBuilder(String.valueOf(altEmpresa))).append("rua = '").append(rua).append("', numero = '").append(numero).append("', bairro = '").append(bairro).append("', cidade = '").append(cidade).append("', uf = '").append(uf).append("', ").toString();
        altEmpresa = (new StringBuilder(String.valueOf(altEmpresa))).append("complemento = '").append(complemento).append("', responsavel = '").append(responsavel).append("', telefone = '").append(telefone).append("', fax = '").append(fax).append("', ").toString();
        altEmpresa = (new StringBuilder(String.valueOf(altEmpresa))).append("celular = '").append(celular).append("', operadora = '").append(operadora).append("', email = '").append(email).append("', site = '").append(site).append("' ").toString();
        altEmpresa = (new StringBuilder(String.valueOf(altEmpresa))).append("WHERE empresaID = '").append(empresaID).append("'").toString();
        return altEmpresa;
    }

    public String mensagem(int numeroMsg)
    {
        switch(numeroMsg)
        {
        case 1: // '\001'
            return "";

        case 2: // '\002'
            return "Dados da Empresa Alterado com Sucesso!";

        case 3: // '\003'
            return "";

        case 4: // '\004'
            return "";

        case 5: // '\005'
            return "";
        }
        return "";
    }

    public int empresaID;
    public String nomeFantasia;
    public String razaoSocial;
    public String ramo;
    public String cnpj;
    public String inscEstadual;
    public String inscMunicipal;
    public String cep;
    public String rua;
    public String numero;
    public String bairro;
    public String cidade;
    public String uf;
    public String complemento;
    public String responsavel;
    public String telefone;
    public String fax;
    public String celular;
    public String operadora;
    public String email;
    public String site;
}
