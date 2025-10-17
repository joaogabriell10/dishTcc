package com.itb.tcc.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Encomenda")
public class Pedido extends EntityBase {
    
    @Column(name = "dataEncomenda")
    private LocalDateTime dataEncomenda;
    
    @Column(name = "comentario")
    private String comentario;
    
    @Column(name = "usuarioId")
    private Long usuarioId;
    
    @Column(name = "quantidade")
    private Integer quantidade;
    
    @Column(name = "preco")
    private Double preco;
    
    @Column(name = "produtoId")
    private Long produtoId;
    
    @Column(name = "retirada")
    private Boolean retirada = false;
    
    @Column(name = "dataRetirada")
    private LocalDateTime dataRetirada;
    
    @ManyToOne
    @JoinColumn(name = "usuarioId", insertable = false, updatable = false)
    private Usuario usuario;
    
    @ManyToOne
    @JoinColumn(name = "produtoId", insertable = false, updatable = false)
    private Produto produto;
    
    public LocalDateTime getDataEncomenda() {
        return dataEncomenda;
    }
    
    public void setDataEncomenda(LocalDateTime dataEncomenda) {
        this.dataEncomenda = dataEncomenda;
    }
    
    public String getComentario() {
        return comentario;
    }
    
    public void setComentario(String comentario) {
        this.comentario = comentario;
    }
    
    public Long getUsuarioId() {
        return usuarioId;
    }
    
    public void setUsuarioId(Long usuarioId) {
        this.usuarioId = usuarioId;
    }
    
    public Integer getQuantidade() {
        return quantidade;
    }
    
    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }
    
    public Double getPreco() {
        return preco;
    }
    
    public void setPreco(Double preco) {
        this.preco = preco;
    }
    
    public Long getProdutoId() {
        return produtoId;
    }
    
    public void setProdutoId(Long produtoId) {
        this.produtoId = produtoId;
    }
    
    public Usuario getUsuario() {
        return usuario;
    }
    
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    public Produto getProduto() {
        return produto;
    }
    
    public void setProduto(Produto produto) {
        this.produto = produto;
    }
    
    public Boolean getRetirada() {
        return retirada;
    }
    
    public void setRetirada(Boolean retirada) {
        this.retirada = retirada;
    }
    
    public LocalDateTime getDataRetirada() {
        return dataRetirada;
    }
    
    public void setDataRetirada(LocalDateTime dataRetirada) {
        this.dataRetirada = dataRetirada;
    }
}
