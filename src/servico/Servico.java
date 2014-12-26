// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   Servico.java

package servico;

import cadastro.*;
import pdv.FormaPagamento;

public class Servico
{

    public Servico()
    {
        cliente = new Cliente();
        empresa = new Empresa();
        formaPagamento = new FormaPagamento();
        formaPagamentoAd = new FormaPagamento();
        usuario = new Usuario();
    }

    public String pesquisaServico()
    {
        String pesquisaEmp = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, servico.* ";
        pesquisaEmp = pesquisaEmp + "FROM servico INNER JOIN cliente ON cliente.clienteID = servico.clienteID ";
        pesquisaEmp = pesquisaEmp + "WHERE servico.servicoID = '" + servicoID + "'";
        return pesquisaEmp;
    }

    public String pesquisaServicoEmpresa()
    {
        String pesquisaEmp = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, servico.* ";
        pesquisaEmp = pesquisaEmp + "FROM servico INNER JOIN cliente ON cliente.clienteID = servico.clienteID ";
        pesquisaEmp = pesquisaEmp + "WHERE servico.servicoID = '" + servicoID + "' AND servico.empresaID = '" + empresa.empresaID + "'";
        return pesquisaEmp;
    }

    public String listaServicos()
    {
        return "SELECT * FROM servico ORDER BY servicoID DESC";
    }

    public String listaServicosPendentes()
    {
        String listaServ = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, servico.* ";
        listaServ = listaServ + "FROM servico INNER JOIN cliente ON cliente.clienteID = servico.clienteID ";
        listaServ = listaServ + "WHERE servico.status = 'M' AND servico.tipo = 'O' AND servico.empresaID = '" + empresa.empresaID + "' ORDER BY servico.servicoID DESC";
        return listaServ;
    }

    public String listaServicosAprovados()
    {
        String listaServ = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, servico.* ";
        listaServ = listaServ + "FROM servico INNER JOIN cliente ON cliente.clienteID = servico.clienteID ";
        listaServ = listaServ + "WHERE servico.status = 'A' AND servico.tipo = 'C' AND servico.empresaID = '" + empresa.empresaID + "' ORDER BY servico.contrato DESC, servico.dataContrato DESC";
        return listaServ;
    }

    public String pesquisaPorCliente(String keyword)
    {
        String listaServ = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, servico.* ";
        listaServ = listaServ + "FROM servico INNER JOIN cliente ON cliente.clienteID = servico.clienteID ";
        listaServ = listaServ + "WHERE servico.status = 'M' AND servico.tipo = 'O' AND servico.empresaID = '" + empresa.empresaID + "' ";
        listaServ = listaServ + "AND cliente.clienteNomeFantasia LIKE '%" + keyword + "%' ORDER BY servico.servicoID DESC";
        return listaServ;
    }

    public String pesquisaPorClienteContratos(String keyword)
    {
        String listaServ = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, servico.* ";
        listaServ = listaServ + "FROM servico INNER JOIN cliente ON cliente.clienteID = servico.clienteID ";
        listaServ = listaServ + "WHERE servico.status = 'A' AND servico.tipo = 'C' AND servico.empresaID = '" + empresa.empresaID + "' ";
        listaServ = listaServ + "AND cliente.clienteNomeFantasia LIKE '%" + keyword + "%' ORDER BY servico.contrato DESC, servico.dataContrato DESC";
        return listaServ;
    }

    public String servicosFechados(String dataInicial, String dataFinal)
    {
        String busca = "SELECT formapagamento.formID, formapagamento.descricao, ";
        busca = busca + "cliente.clienteID, cliente.clienteNomeFantasia, ";
        busca = busca + "servico.* FROM servico ";
        busca = busca + "INNER JOIN formapagamento ON formapagamento.formID = servico.formPagID ";
        busca = busca + "LEFT JOIN cliente ON cliente.clienteID = servico.clienteID ";
        busca = busca + "WHERE servico.dataFim BETWEEN '" + dataInicial + "' AND '" + dataFinal + " 23:59:59" + "' ";
        busca = busca + "AND servico.status = 'F' AND servico.empresaID = '" + empresa.empresaID + "' ";
        busca = busca + "ORDER BY dataFim DESC";
        return busca;
    }

    public String ultimoServico()
    {
        return "SELECT * FROM servico ORDER BY servicoID DESC LIMIT 1";
    }

    public String ultimoServicoAno(String ano)
    {
        return "SELECT * FROM servico WHERE dataInicio LIKE '" + ano + "%' ORDER BY servicoID DESC LIMIT 1";
    }

    public String ultimoContratoAno(String ano)
    {
        return "SELECT MAX(contrato) AS ultimoContrato FROM servico WHERE dataContrato LIKE '" + ano + "%'";
    }

    public String aprovadoPorCliente()
    {
        String altera = "UPDATE servico SET contrato = '" + contrato + "', dataContrato = '" + dataContrato + "', status = 'A', tipo = 'C' ";
        altera = altera + "WHERE servicoID = '" + servicoID + "'";
        return altera;
    }

    public String cadastraServico()
    {
        String salvaServ = "INSERT INTO servico ";
        salvaServ = salvaServ + "(orcamento, contrato, clienteID, empresaID, descricao, dataInicio, dataContrato, valor, usuario) ";
        salvaServ = salvaServ + "VALUES ";
        salvaServ = salvaServ + "('" + orcamento + "', '" + contrato + "', '" + cliente.clienteID + "', '" + empresa.empresaID + "', ";
        salvaServ = salvaServ + "'" + descricao + "', '" + dataInicio + "', '" + dataInicio + "', '" + valor + "', '" + usuario.usuarioID + "')";
        return salvaServ;
    }

    public String completaServico()
    {
        String completa = "UPDATE servico ";
        completa = completa + "SET formPagID = '" + formaPagamento.formPagID + "', vezes = '" + vezes + "', ";
        completa = completa + "valor = '" + valor + "', entrada = '" + entrada + "', troco = '" + troco + "', status = 'F' ";
        completa = completa + "WHERE servicoID = '" + servicoID + "'";
        return completa;
    }

    public String completaInformacoesServico()
    {
        String completa = "UPDATE servico ";
        completa = completa + "SET formPagID = '" + formaPagamento.formPagID + "', vezes = '" + vezes + "', ";
        completa = completa + "valor = '" + valor + "', pagoNaAprovacao = '" + valor + "', entrada = '" + entrada + "', troco = '" + troco + "', desconto = '" + desconto + "' ";
        completa = completa + "WHERE servicoID = '" + servicoID + "'";
        return completa;
    }

    public String adiantamentoServico()
    {
        String completa = "UPDATE servico ";
        completa = completa + "SET formPagIDAd = '" + formaPagamentoAd.formPagID + "', vezesAd = '" + vezesAd + "', ";
        completa = completa + "valor = '" + valor + "', entradaAd = '" + entradaAd + "', status = 'A', tipo = 'C' ";
        completa = completa + "WHERE servicoID = '" + servicoID + "'";
        return completa;
    }

    public String atualizaServico()
    {
        String alterServ = "UPDATE servico ";
        alterServ = alterServ + "SET descricao = '" + descricao + "' ";
        alterServ = alterServ + "WHERE servicoID = '" + servicoID + "'";
        return alterServ;
    }

    public String atualizaNumeroART()
    {
        String alterServ = "UPDATE servico ";
        alterServ = alterServ + "SET numeroART = '" + numeroART + "' ";
        alterServ = alterServ + "WHERE servicoID = '" + servicoID + "'";
        return alterServ;
    }

    public String atualizaValorServico()
    {
        String alterServ = "UPDATE servico ";
        alterServ = alterServ + "SET valor = '" + valor + "' ";
        alterServ = alterServ + "WHERE servicoID = '" + servicoID + "'";
        return alterServ;
    }

    public String visualizado()
    {
        return "UPDATE servico SET visualizacao = 'S' WHERE servicoID = '" + servicoID + "'";
    }

    public String naoVisualizado()
    {
        return "UPDATE servico SET visualizacao = 'N' WHERE servicoID = '" + servicoID + "'";
    }

    public String visualizar()
    {
        return "UPDATE servico SET visualizar = 'S' WHERE servicoID = '" + servicoID + "'";
    }

    public String naoVisualizar()
    {
        return "UPDATE servico SET visualizar = 'N' WHERE servicoID = '" + servicoID + "'";
    }

    public String excluiServico()
    {
        return "DELETE FROM servico WHERE servicoID = '" + servicoID + "'";
    }

    public String mensagem(int numeroMsg)
    {
        switch(numeroMsg)
        {
        case 1: // '\001'
            return "Or\347amento Cadastrado com Sucesso!";

        case 2: // '\002'
            return "Or\347amento Atualizado com Sucesso!";

        case 3: // '\003'
            return "Servi\347o Excluido com Sucesso!";

        case 4: // '\004'
            return "Confirmado a Visualiza\347\343o";

        case 5: // '\005'
            return "Contrato gerado com Sucesso!";

        case 6: // '\006'
            return "Modo de Visualizar alterado com Sucesso!";
        }
        return "";
    }

    public int servicoID;
    public int orcamento;
    public int contrato;
    public Cliente cliente;
    public Empresa empresa;
    public String descricao;
    public FormaPagamento formaPagamento;
    public FormaPagamento formaPagamentoAd;
    public float entrada;
    public float entradaAd;
    public float troco;
    public int vezes;
    public int vezesAd;
    public float desconto;
    public String dataInicio;
    public String dataContrato;
    public String dataFim;
    public float valor;
    public float pagoNaAprovacao;
    public String numeroART;
    public Usuario usuario;
}
