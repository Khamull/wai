// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ServicoMetroQuadrado.java

package servico;


// Referenced classes of package servico:
//            Servico, Servicos

public class ServicoMetroQuadrado
{

    public ServicoMetroQuadrado()
    {
        servico = new Servico();
        servicos = new Servicos();
    }

    public String listaItens()
    {
        String listServ = "SELECT servicos.servicoID, servicos.tipo, servicometroquadrado.* ";
        listServ = listServ + "FROM servicometroquadrado ";
        listServ = listServ + "INNER JOIN servicos ON servicos.servicoID = servicometroquadrado.servicosID ";
        listServ = listServ + "WHERE servicometroquadrado.servicoID = '" + servico.servicoID + "'";
        return listServ;
    }

    public String servicoPorID()
    {
        return "SELECT * FROM servicometroquadrado WHERE servicometroquadradoID = '" + servicometroquadradoID + "'";
    }

    public String salvaServico()
    {
        String salvaServ = "INSERT INTO servicometroquadrado (servicoID, servicosID, descricao, valor, quantidade) ";
        salvaServ = salvaServ + "VALUES ('" + servico.servicoID + "', '" + servicos.servicoID + "', '" + descricao + "', '" + valor + "', '" + quantidade + "')";
        return salvaServ;
    }

    public String excluirServico()
    {
        return "DELETE FROM servicometroquadrado WHERE servicometroquadradoID = '" + servicometroquadradoID + "'";
    }

    public int servicometroquadradoID;
    public Servico servico;
    public Servicos servicos;
    public String descricao;
    public float valor;
    public float quantidade;
}
