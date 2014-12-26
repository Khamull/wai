// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   EnderecoEntrega.java

package servico;

import cadastro.Cliente;

// Referenced classes of package servico:
//            Servico

public class EnderecoEntrega
{

    public EnderecoEntrega()
    {
        cliente = new Cliente();
        servico = new Servico();
    }

    public String enderecoPorServicoID()
    {
        return "SELECT * FROM enderecoEntrega WHERE servicoID = '" + servico.servicoID + "'";
    }

    public String salvaEndereco()
    {
        String salvaEnd = "INSERT INTO enderecoEntrega ";
        salvaEnd = salvaEnd + "(logradouro, numero, complemento, bairro, cidade, uf, cep, clienteID, servicoID) ";
        salvaEnd = salvaEnd + "VALUES ";
        salvaEnd = salvaEnd + "('" + logradouro + "', '" + numero + "', '" + complemento + "', '" + bairro + "', '" + cidade + "', ";
        salvaEnd = salvaEnd + "'" + uf + "', '" + cep + "', '" + cliente.clienteID + "', '" + servico.servicoID + "')";
        return salvaEnd;
    }

    public String alteraEndereco()
    {
        String alterEnd = "UPDATE enderecoEntrega ";
        alterEnd = alterEnd + "SET logradouro = '" + logradouro + "', numero = '" + numero + "', complemento = '" + complemento + "', ";
        alterEnd = alterEnd + "bairro = '" + bairro + "', cidade = '" + cidade + "', uf = '" + uf + "', cep = '" + cep + "' ";
        alterEnd = alterEnd + "WHERE servicoID = '" + servico.servicoID + "'";
        return alterEnd;
    }

    public String mensagem(int numeroMsg)
    {
        switch(numeroMsg)
        {
        case 1: // '\001'
            return "Endere\347o Salvo com Sucesso!";

        case 2: // '\002'
            return "";

        case 3: // '\003'
            return "";

        case 4: // '\004'
            return "";
        }
        return "";
    }

    public int enderecoEntregaID;
    public String logradouro;
    public String numero;
    public String complemento;
    public String bairro;
    public String cidade;
    public String uf;
    public String cep;
    public Cliente cliente;
    public Servico servico;
}
