// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   Download.java

package servico;

import cadastro.Cliente;

public class Download
{

    public Download()
    {
        cliente = new Cliente();
    }

    public String pesquisaDownload()
    {
        String busca = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, download.* ";
        busca = (new StringBuilder(String.valueOf(busca))).append("FROM download INNER JOIN cliente ON cliente.clienteID = download.clienteID ").toString();
        busca = (new StringBuilder(String.valueOf(busca))).append("ORDER BY download.downloadID DESC").toString();
        return busca;
    }

    public String downloadPorCliente()
    {
        String busca = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, download.* ";
        busca = (new StringBuilder(String.valueOf(busca))).append("FROM download INNER JOIN cliente ON cliente.clienteID = download.clienteID ").toString();
        busca = (new StringBuilder(String.valueOf(busca))).append("WHERE cliente.clienteID = '").append(cliente.clienteID).append("' ").toString();
        busca = (new StringBuilder(String.valueOf(busca))).append("ORDER BY download.downloadID DESC").toString();
        return busca;
    }

    public String pesquisaPorCliente(String keyword)
    {
        String busca = "SELECT cliente.clienteID, cliente.clienteNomeFantasia, download.* ";
        busca = (new StringBuilder(String.valueOf(busca))).append("FROM download INNER JOIN cliente ON cliente.clienteID = download.clienteID ").toString();
        busca = (new StringBuilder(String.valueOf(busca))).append("WHERE cliente.clienteNomeFantasia LIKE '%").append(keyword).append("%' ").toString();
        busca = (new StringBuilder(String.valueOf(busca))).append("ORDER BY download.downloadID DESC").toString();
        return busca;
    }

    public String insereDownload()
    {
        return (new StringBuilder("INSERT INTO download (clienteID, arquivo, titulo, contrato) VALUES ('")).append(cliente.clienteID).append("', '").append(arquivo).append("', '").append(titulo).append("', '").append(contrato).append("')").toString();
    }

    public int downloadID;
    public Cliente cliente;
    public String arquivo;
    public String titulo;
    public String contrato;
}
