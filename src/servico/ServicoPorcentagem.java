// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ServicoPorcentagem.java

package servico;


// Referenced classes of package servico:
//            Servico, Servicos

public class ServicoPorcentagem
{

    public ServicoPorcentagem()
    {
        servico = new Servico();
        servicos = new Servicos();
    }

    public String listaItens()
    {
        return (new StringBuilder("SELECT * FROM servicoporcentagem WHERE servicoID = '")).append(servico.servicoID).append("'").toString();
    }

    public String servicoPorID()
    {
        return (new StringBuilder("SELECT * FROM servicoporcentagem WHERE servicoporcentagemID = '")).append(servicoporcentagemID).append("'").toString();
    }

    public String salvaServico()
    {
        String salvaServ = "INSERT INTO servicoporcentagem (servicoID, servicosID, descricao, valor, quantidade) ";
        salvaServ = (new StringBuilder(String.valueOf(salvaServ))).append("VALUES ('").append(servico.servicoID).append("', '").append(servicos.servicoID).append("', '").append(descricao).append("', '").append(valor).append("', '").append(quantidade).append("')").toString();
        return salvaServ;
    }

    public String excluirServico()
    {
        return (new StringBuilder("DELETE FROM servicoporcentagem WHERE servicoporcentagemID = '")).append(servicoporcentagemID).append("'").toString();
    }

    public int servicoporcentagemID;
    public Servico servico;
    public Servicos servicos;
    public String descricao;
    public float valor;
    public float quantidade;
}
