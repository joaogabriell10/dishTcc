package com.itb.tcc.repository;

import org.springframework.stereotype.Repository;

import com.itb.tcc.entity.Pedido;

@Repository
public interface PedidoRepository extends RepositoryBase<Pedido> {
    // Método para buscar encomendas por usuário
    java.util.List<Pedido> findByUsuarioId(Long usuarioId);
}