// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   Parametros.java

package cadastro;


public class Parametros
{

    public Parametros()
    {
    }

    public String pesquisaParametroPorCodigo()
    {
        String pesquisa = "SELECT * FROM parametros ";
        pesquisa = pesquisa + "WHERE codigoParametro = '" + codigoParametro + "' ";
        return pesquisa;
    }

    public String atualizaParametro()
    {
        String atualiza = "UPDATE parametros ";
        atualiza = atualiza + "SET valorParametro = '" + valorParametro + "' ";
        atualiza = atualiza + "WHERE codigoParametro = '" + codigoParametro + "'";
        return atualiza;
    }

    public String mensagem(int numeroMsg)
    {
        switch(numeroMsg)
        {
        case 1: // '\001'
            return "Parametro Cadastrado com Sucesso!";

        case 2: // '\002'
            return "Parametro Alterado com Sucesso!";

        case 3: // '\003'
            return "";

        case 4: // '\004'
            return "";

        case 5: // '\005'
            return "";

        case 6: // '\006'
            return "";
        }
        return "";
    }

    public int parametroID;
    public String codigoParametro;
    public String nomeParametro;
    public int valorParametro;
    public String statusParametro;
}
