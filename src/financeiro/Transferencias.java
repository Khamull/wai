// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   Transferencias.java

package financeiro;


public class Transferencias
{

    public Transferencias()
    {
    }

    public String ultimaTransferencia()
    {
        return "SELECT * FROM transferencias ORDER BY transferenciaID DESC LIMIT 1";
    }

    public String transferenciaPorID()
    {
        return (new StringBuilder("SELECT * FROM transferencias WHERE transferenciaID = '")).append(transferenciaID).append("'").toString();
    }

    public String cadastraTransferencia()
    {
        String cadastro = "INSERT INTO transferencias ";
        cadastro = (new StringBuilder(String.valueOf(cadastro))).append("(bancoDe, bancoPara, valor, observacoes) ").toString();
        cadastro = (new StringBuilder(String.valueOf(cadastro))).append("VALUES ('").append(bancoDe).append("', '").append(bancoPara).append("', '").append(valor).append("', '").append(observacoes).append("')").toString();
        return cadastro;
    }

    public String listaTranferenciasPorData(String dataInicio, String dataFim)
    {
        String busca = "SELECT * FROM transferencias ";
        busca = (new StringBuilder(String.valueOf(busca))).append("WHERE data BETWEEN '").append(dataInicio).append("' AND '").append(dataFim).append(" 23:59:59").append("'").toString();
        busca = (new StringBuilder(String.valueOf(busca))).append("ORDER BY data ASC").toString();
        return busca;
    }

    public int transferenciaID;
    public int bancoDe;
    public int bancoPara;
    public float valor;
    public String observacoes;
    public String data;
}
