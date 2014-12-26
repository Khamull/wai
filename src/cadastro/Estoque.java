// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   Estoque.java

package cadastro;


// Referenced classes of package cadastro:
//            Fornecedor, Produto

public class Estoque
{

    public Estoque()
    {
        fornecedor = new Fornecedor();
        produto = new Produto();
    }

    public String pesquisaEstoque()
    {
        return (new StringBuilder("SELECT estoque FROM produto WHERE produtoID = '")).append(produto.produtoID).append("'").toString();
    }

    public String salvaEstoque()
    {
        String salvarEst = "INSERT INTO estoque ";
        salvarEst = (new StringBuilder(String.valueOf(salvarEst))).append("(fornecedorID, produtoID, quantidade, precoCusto, preco, lucro, unidade, usuario) ").toString();
        salvarEst = (new StringBuilder(String.valueOf(salvarEst))).append("VALUES ").toString();
        salvarEst = (new StringBuilder(String.valueOf(salvarEst))).append("('").append(fornecedor.fornecedorID).append("', '").append(produto.produtoID).append("', '").append(quantidade).append("', '").append(produto.precoCusto).append("', '").append(produto.preco).append("', '").append(produto.lucro).append("', '").append(produto.unidade).append("', '").append(usuario).append("')").toString();
        return salvarEst;
    }

    public String alteraEstoqueProduto()
    {
        return (new StringBuilder("UPDATE produto SET precoCusto = '")).append(produto.precoCusto).append("', preco = '").append(produto.preco).append("', estoque = '").append(quantidade).append("', lucro = '").append(produto.lucro).append("', unidade = '").append(produto.unidade).append("' WHERE produtoID = '").append(produto.produtoID).append("'").toString();
    }

    public String alteraEstoque()
    {
        return (new StringBuilder("UPDATE produto SET estoque = '")).append(produto.estoque).append("' WHERE produtoID = '").append(produto.produtoID).append("'").toString();
    }

    public String mensagem(int numeroMsg)
    {
        switch(numeroMsg)
        {
        case 1: // '\001'
            return "";

        case 2: // '\002'
            return "";

        case 3: // '\003'
            return "";

        case 4: // '\004'
            return "";

        case 5: // '\005'
            return "";
        }
        return "";
    }

    public int estoqueID;
    public Fornecedor fornecedor;
    public Produto produto;
    public float quantidade;
    public String usuario;
}
