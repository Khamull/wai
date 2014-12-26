// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   Servicos.java

package servico;


public class Servicos
{

    public Servicos()
    {
    }

    public String listaTodosServicos()
    {
        return "SELECT * FROM servicos ORDER BY servicoID DESC";
    }

    public String listaServicosAtivos()
    {
        return "SELECT * FROM servicos WHERE servicoAtivo = 'S' ORDER BY servicoID DESC";
    }

    public String servicoPorID()
    {
        return "SELECT * FROM servicos WHERE servicoID = '" + servicoID + "'";
    }

    public String servicosM()
    {
        return "SELECT * FROM servicos WHERE servicoAtivo = 'S' AND tipo = 'M' OR servicoAtivo = 'S' AND tipo = 'V'";
    }

    public String servicosP()
    {
        return "SELECT * FROM servicos WHERE servicoAtivo = 'S' AND tipo = 'P'";
    }

    public String cadastraServico()
    {
        return "INSERT INTO servicos (servicoTitulo, tipo, valorM, valorP) VALUES ('" + servicoTitulo + "', '" + tipo + "', '" + valorM + "', '" + valorP + "')";
    }

    public String alteraServico()
    {
        String altServ = "UPDATE servicos SET servicoTitulo = '" + servicoTitulo + "', tipo = '" + tipo + "', ";
        altServ = altServ + "valorM = '" + valorM + "', valorP = '" + valorP + "' ";
        altServ = altServ + "WHERE servicoID = '" + servicoID + "'";
        return altServ;
    }

    public String excluiServico()
    {
        return "DELETE FROM servicos WHERE servicoID = '" + servicoID + "'";
    }

    public String mensagem(int numeroMsg)
    {
        switch(numeroMsg)
        {
        case 1: // '\001'
            return "Servi\347o Cadastrado com Sucesso!";

        case 2: // '\002'
            return "Servi\347o Atualizado com Sucesso!";

        case 3: // '\003'
            return "Servi\347o Excluido com Sucesso!";

        case 4: // '\004'
            return "";

        case 5: // '\005'
            return "";
        }
        return "";
    }

    public int servicoID;
    public String servicoTitulo;
    public float valorM;
    public int valorP;
    public String tipo;
}
